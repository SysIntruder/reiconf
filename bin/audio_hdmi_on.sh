#!/bin/sh
pactl set-default-sink "$(pactl list sinks | grep "Name:" | grep "hdmi" | awk '{ print $2 }')" && pkill -SIGRTMIN+10 i3blocks 
