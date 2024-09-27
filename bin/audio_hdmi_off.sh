#!/bin/sh
pactl set-default-sink "alsa_output.pci-0000_03_00.6.analog-stereo.2" && pkill -SIGRTMIN+10 i3blocks  
