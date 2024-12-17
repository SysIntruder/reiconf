#!/bin/sh

MTP_MOUNT="$HOME/Android"

# Detect MTP devices, remove "1: ", "(id2)" and "(MTP)"
MTP_DEVICES=$(simple-mtpfs -l | grep -oE '^[0-9]+: .+' | sed 's/^[0-9]\+: //' | sed 's/(id[0-9])//g' | sed 's/(MTP)//g')

# Detect USB devices (excluding nvme0n1)
USB_DEVICES=$(lsblk -rno NAME,LABEL,TYPE,MOUNTPOINT | grep 'disk' | grep -v 'nvme0n1' | awk '{if ($2 != "") print $1 ": " $2 " (" $3 ")"}')

# Add mount/unmount status to MTP devices
MTP_DEVICES_WITH_STATUS=""
for device in $MTP_DEVICES; do
    if [[ -n "$device" ]]; then  # Skip empty strings
        DEVICE_NUM=$(simple-mtpfs -l | grep "$device" | awk '{print $1}' | cut -d':' -f1)
        MTP_MOUNT_DIR="$MTP_MOUNT/android$DEVICE_NUM"
        if [[ -n "$MTP_DEVICES_WITH_STATUS" ]]; then
          MTP_DEVICES_WITH_STATUS+="\n"
        fi
        if mountpoint -q "$MTP_MOUNT_DIR"; then
            MTP_DEVICES_WITH_STATUS+="MTP:$device [Mounted]"
        else
            MTP_DEVICES_WITH_STATUS+="MTP:$device [Unmounted]"
        fi
    fi
done

# Add mount/unmount status to USB devices
USB_DEVICES_WITH_STATUS=""
for device in $USB_DEVICES; do
    if [[ -n "$device" ]]; then  # Skip empty strings
        DEVICE_NAME=$(echo "$device" | cut -d':' -f1)
        MOUNT_PATH=$(udisksctl info -b /dev/$DEVICE_NAME | grep MountPoints | awk '{print $2}')
        if [[ -n "$USB_DEVICES_WITH_STATUS" ]]; then
          USB_DEVICES_WITH_STATUS+="\n"
        fi
        if [[ -n "$MOUNT_PATH" ]]; then
            USB_DEVICES_WITH_STATUS+="USB:$device [Mounted]"
        else
            USB_DEVICES_WITH_STATUS+="USB:$device [Unmounted]"
        fi
    fi
done

# Combine MTP and USB devices for selection
COMBINED_DEVICES="$MTP_DEVICES_WITH_STATUS$USB_DEVICES_WITH_STATUS"

# Check if there are any devices to display
if [[ -z "$COMBINED_DEVICES" ]]; then
    notify-send "Device Mount" "No devices detected."
    exit 1
fi

# Display devices in dmenu
DEVICE_CHOICE=$(echo -e "$COMBINED_DEVICES" | dmenu -l 20 -i -p "Mount/Unmount Devices:")

if [[ -z "$DEVICE_CHOICE" ]]; then
    notify-send "Device Mount" "No device selected."
    exit 1
fi

# Process selection
if [[ "$DEVICE_CHOICE" == "MTP:"* ]]; then
    # Handle MTP devices
    DEVICE_NAME=$(echo "$DEVICE_CHOICE" | cut -d':' -f2 | sed 's/ \[.*\]//')
    DEVICE_NUM=$(simple-mtpfs -l | grep "$DEVICE_NAME" | awk '{print $1}' | cut -d':' -f1)
    MTP_MOUNT_DIR="$MTP_MOUNT/$DEVICE_NAME"

    mkdir -p "$MTP_MOUNT_DIR"

    if mountpoint -q "$MTP_MOUNT_DIR"; then
        fusermount -u "$MTP_MOUNT_DIR"
        notify-send "MTP Device" "$DEVICE_NAME unmounted successfully."
    else
        simple-mtpfs --device "$DEVICE_NUM" "$MTP_MOUNT_DIR"
        if [[ $? -eq 0 ]]; then
            notify-send "MTP Device" "$DEVICE_NAME mounted at $MTP_MOUNT_DIR."
        else
            notify-send "MTP Mount" "Failed to mount $DEVICE_NAME."
        fi
    fi

elif [[ "$DEVICE_CHOICE" == "USB:"* ]]; then
    # Handle USB devices
    DEVICE_NAME=$(echo "$DEVICE_CHOICE" | cut -d':' -f1)
    MOUNT_PATH=$(udisksctl info -b /dev/$DEVICE_NAME | grep MountPoints | awk '{print $2}')

    if [[ -n "$MOUNT_PATH" ]]; then
        # Unmount if already mounted
        udisksctl unmount -b /dev/$DEVICE_NAME
        notify-send "USB Device" "$DEVICE_NAME unmounted successfully."
    else
        # Mount the USB device
        udisksctl mount -b /dev/$DEVICE_NAME
        if [[ $? -eq 0 ]]; then
            MOUNT_PATH=$(udisksctl info -b /dev/$DEVICE_NAME | grep MountPoints | awk '{print $2}')
            notify-send "USB Device" "$DEVICE_NAME mounted at $MOUNT_PATH."
        else
            notify-send "USB Mount" "Failed to mount $DEVICE_NAME."
        fi
    fi
else
    notify-send "Device Mount" "Unknown device type."
fi
