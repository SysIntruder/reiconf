#!/bin/sh

if [[ -z "$STEP" ]]; then
  STEP="${1:-5}"
fi

case $BLOCK_BUTTON in
  1) $(pactl set-source-mute @DEFAULT_SOURCE@ toggle) ;;
  4) $(pactl set-source-volume @DEFAULT_SOURCE@ +$STEP%) ;;
  5) $(pactl set-source-volume @DEFAULT_SOURCE@ -$STEP%) ;;
esac

amixer sget Capture | awk -F "[][]" '/Left:/ { if($4=="on") print $2; else print "MUTE" }' 2>/dev/null
