#!/bin/sh

CPU=$(sar -u 1 1 | awk '$1 ~ /^Average/ && $8 ~ /[0-9.]+/ { printf("%0.2f%%\n", 100 - $8) }' 2>/dev/null)

echo "$CPU"
echo "$CPU"

if [ ${CPU%?} -ge 80 ]; then 
  echo "#FF0000"
elif [ ${CPU%?} -ge 60 ]; then
  echo "#FFA000"
fi
