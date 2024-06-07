#!/bin/sh

USED=$(df -hPl / | awk '/dev/ { print $5 }')

echo "$USED"
echo "$USED"

if [ ${USED%?} -ge 80 ]; then
  echo "#FF0000"
elif [ ${USED%?} -ge 75 ]; then
  echo "#FFA800"
fi
