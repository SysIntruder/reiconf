#!/bin/sh

STATUS=$(xrandr | grep "HDMI" | awk '{ print $2 }')

if [ "$STATUS" == "disconnected" ]; then
  exit 0
fi

HDMI=$(xrandr | grep "HDMI" | awk '{ print $1 }')

xrandr --output "$HDMI" --mode 1920x1080
