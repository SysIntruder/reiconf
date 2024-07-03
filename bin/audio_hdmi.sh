#!/bin/sh

HDMI=$(pactl list sinks | grep "Name:" | grep "hdmi" | awk '{ print $2 }')
DEFAULT="alsa_output.pci-0000_03_00.6.analog-stereo.2"
CUR=$(pactl get-default-sink)

if [ -z "$HDMI" ]; then
  exit 0
fi

if [ "$CUR" == "$DEFAULT" ]; then
  pactl set-default-sink "$HDMI" && pkill -SIGRTMIN+10 i3blocks 
else
  pactl set-default-sink "$DEFAULT" && pkill -SIGRTMIN+10 i3blocks  
fi
