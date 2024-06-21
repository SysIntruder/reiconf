#!/bin/sh

case $BLOCK_BUTTON in
  1) $(playerctl play-pause) ;;
esac

STATUS=$(playerctl status 2>/dev/null)
[ "$STATUS" = "Playing" ] || [ "$STATUS" = "Paused" ] && echo "$(playerctl metadata artist 2>/dev/null) - $(playerctl metadata title 2>/dev/null)"
