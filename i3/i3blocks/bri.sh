#!/bin/sh

if [[ -z "$STEP" ]]; then
  STEP="${1:-5}"
fi

case $BLOCK_BUTTON in
  4) $(xbacklight -inc $STEP) ;;
  5) $(xbacklight -dec $STEP) ;;
esac

xbacklight -get | awk '{ print $1"%" }' 2>/dev/null
