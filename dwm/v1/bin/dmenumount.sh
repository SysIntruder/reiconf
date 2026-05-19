#!/bin/sh

MTPTARGET="$HOME/Android"

get_usb() {
  lsblk -rno NAME,TYPE,MOUNTPOINT |
    grep -Ev 'disk|nvme0n1' |
    awk '{ printf "USB:%s [%s]\n", $1, $3 }'
}

get_mtp() {
  lsusb |
    grep 'MTP' |
    cut -d' ' -f7- |
    sed 's/ *(MTP)//; s/^/MTP:/' |
    while IFS= read -r line; do
      NAME="$(echo "$line" | sed 's/^MTP://; s/\//_/g')"
      MP="$MTPTARGET/$NAME"
      if [[ -d "$MP" ]]; then
        if mountpoint -q "$MP"; then
          echo "$line [$MP]"
        else
          echo "$line []"
        fi
      else
        echo "$line []"
      fi
    done
}

menu() {
  {
    get_usb
    get_mtp
  } | dmenu -i -l 25 -p "Mount USB/MTP"
}

handle() {
  if [[ "$1" == "USB:"* ]]; then
    MOUNTED="$(echo "$1" | sed -n 's/.*\[\(.*\)\]/\1/p')"
    DEV="$(echo "$1" | sed -E 's/^.*:(\S+).*/\1/')"
    if [[ -n "$MOUNTED" ]]; then
      udisksctl unmount -b /dev/$DEV
      notify-send "USB Device" "$DEV successfully unmounted"
    else
      udisksctl mount -b /dev/"$DEV"
      if [[ $? -eq 0 ]]; then
        MP=$(udisksctl info -b /dev/$DEV | grep MountPoints | awk '{print $2}')
        notify-send "USB Device" "$DEV mounted at $MP."
      else
        notify-send "USB Device" "Failed to mount $DEV"
      fi
    fi
  elif [[ "$1" == "MTP:"* ]]; then
    NAME="$(echo $1 | sed -E 's/^MTP:(.*) \[.*\]$/\1/')"
    DEV="$(lsusb | grep "$NAME" | awk '{ printf "%s,%s", $2, $4 }' | sed 's/:$//')"
    MP="$MTPTARGET/$(echo "$NAME" | sed 's/\//_/g')"
    mkdir -p "$MP"
    if mountpoint -q "$MP"; then
      fusermount -u "$MP"
      notify-send "MTP Device" "$NAME successfully unmounted"
    else
      jmtpfs -device="$DEV" "$MP" -o allow_other -o direct_io
      if [[ $? -eq 0 ]]; then
        notify-send "MTP Device" "$NAME mounted at $MP."
      else
        notify-send "MTP Device" "Failed to mount $NAME"
      fi
    fi
  fi
}

choice=$(menu)
handle "$choice"
