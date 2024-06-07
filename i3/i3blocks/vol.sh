#!/bin/sh

if [[ -z "$STEP" ]]; then
  STEP="${1:-5}"
fi

case $BLOCK_BUTTON in
  1) $(pactl set-sink-mute @DEFAULT_SINK@ toggle) ;;
  4) $(pactl set-sink-volume @DEFAULT_SINK@ +$STEP%) ;;
  5) $(pactl set-sink-volume @DEFAULT_SINK@ -$STEP%) ;;
esac

amixer sget Master | awk -F "[][]" '/Left:/ { if($4=="on") print $2; else print "MUTE" }' 2>/dev/null
