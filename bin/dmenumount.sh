#!/bin/sh

MOUNTMTP="$HOME/Android"

get_usb() {
  lsblk -rno NAME,TYPE,MOUNTPOINT |
    grep -Ev 'disk|nvme0n1' |
    awk '{ printf "USB:%s [%s]\n", $1, $3 }'
}

get_mtp() {
  simple-mtpfs -l |
    sed -E 's/ //; s/[[:space:]]\(id[0-9]\)//; s/[[:space:]]\(MTP\)/:MTP/; s/([^:]+):([^:]+):([^:]+)/\3:\1:\2/' |
    while IFS= read -r line; do
      NAME="$(echo "$line" | sed -E 's/^[^:]+:[^:]+:([^ ]+).*/\1/')"
      MP="$MOUNTMTP/$NAME"
      if mountpoint -q "$MP"; then
        echo "$line [$MP]"
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
        MOUNTP=$(udisksctl info -b /dev/$DEV | grep MountPoints | awk '{print $2}')
        notify-send "USB Device" "$DEV mounted at $MOUNTP."
      else
        notify-send "USB Device" "Failed to mount $DEV"
      fi
    fi
  elif [[ "$1" == "MTP:"* ]]; then
    DEV="$(echo $1 | awk -F: '{ print $2 }')"
    NAME="$(echo $1 | sed -E 's/^[^:]+:[^:]+:([^ ]+).*/\1/')"
    MOUNTTARGET="$MOUNTMTP/$NAME"
    mkdir -p "$MOUNTTARGET"
    if mountpoint -q "$MOUNTTARGET"; then
      fusermount -u "$MOUNTTARGET"
      notify-send "MTP Device" "$NAME successfully unmounted"
    else
      simple-mtpfs --device "$DEV" "$MOUNTTARGET"
      if [[ $? -eq 0 ]]; then
        notify-send "MTP Device" "$NAME mounted at $MOUNTTARGET."
      else
        notify-send "MTP Device" "Failed to mount $NAME"
      fi
    fi
  fi
}

choice=$(menu)
handle "$choice"
