#!/bin/sh

BAT=$(acpi | awk '{ gsub(",", "", $4); print $4 }')
STATUS=$(acpi | awk '{ gsub(",", "", $3); print $3 }')

echo "$BAT"
echo "$BAT"

if [ "$STATUS" = "Charging" ]; then
  echo "#2E9EF4"
else
  if [ ${BAT%?} -le 15 ]; then
    notify-send -u critical "Battery Low: $BAT"
    echo "#FF0000"
  elif [ ${BAT%?} -le 20 ]; then
    notify-send -u critical "Battery Low: $BAT"
    echo "#FFA800"
  fi
fi
