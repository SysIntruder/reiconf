#!/bin/sh

INTERFACE=$1
EVENT=$2

case "$EVENT" in
  up | down)
    pkill -RTMIN+6 dsblocks
    ;;
esac
EOF
