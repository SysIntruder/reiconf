#!/bin/sh

OFF="<span foreground=\"#888888\"><s>DND</s></span>"
ON="<span>DND</span>"

case $BLOCK_BUTTON in
  1) $(dunstctl set-paused toggle)
esac

[ "$(dunstctl is-paused)" = "true" ] && echo "$ON" || echo "$OFF"
