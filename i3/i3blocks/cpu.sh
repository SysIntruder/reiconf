#!/bin/sh

case $BLOCK_BUTTON in
  1) $(i3-msg exec 'st -T "htop" -e htop') ;;
esac

CPU=$(sar -u 1 1 --dec=0 | awk '$1 ~ /^Average/ && $8 ~ /[0-9.]+/ { print 100 - $8"%" }' 2>/dev/null)

echo "$CPU"
echo "$CPU"

if [ ${CPU%?} -ge 80 ]; then 
  echo "#FF0000"
elif [ ${CPU%?} -ge 60 ]; then
  echo "#FFA000"
fi
