#!/bin/sh

case $BLOCK_BUTTON in
  1) $(playerctl play-pause) ;;
esac

STATUS=$(playerctl status)
[ "$STATUS" = "Playing" ] || [ "$STATUS" = "Paused" ] && echo "$(playerctl metadata artist) - $(playerctl metadata title)"
