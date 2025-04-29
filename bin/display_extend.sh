#!/bin/sh
xrandr --output eDP --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-A-0 --mode 1920x1080 --pos 1920x0 --rotate normal && display -window root ~/.local/share/backgrounds/wallpaper.png
