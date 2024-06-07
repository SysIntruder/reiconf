#!/bin/sh

PICTURE=/tmp/i3lock.png
SCREENSHOT="scrot -z $PICTURE"

scrot -z $PICTURE
magick $PICTURE -blur 0x5 -fill black -colorize 40% $PICTURE
i3lock -i $PICTURE
rm $PICTURE
