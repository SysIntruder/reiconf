#!/bin/sh
xrandr --output eDP --off --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal && display -window root ~/.local/share/backgrounds/wallpaper.png
