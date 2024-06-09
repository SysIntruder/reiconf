#!/bin/sh

case $BLOCK_BUTTON in
  1) $(i3-msg exec 'st -T "htop" -e htop') ;;
esac

MEM=$(sar -r 1 1 | awk '$1 ~ /^Average/ && $5 ~ /[0-9.]+/ { printf("%0.2f%%\n", $5) }' 2>/dev/null)

echo "$MEM"
echo "$MEM"

if [ ${MEM%?} -ge 80 ]; then 
  echo "#FF0000"
elif [ ${MEM%?} -ge 60 ]; then
  echo "#FFA000"
fi
