#!/bin/sh

case $BLOCK_BUTTON in
  1) $(i3-msg exec 'st -T "nmtui" -e nmtui') ;;
esac

IFACE=$(ip r | awk '/^default/ { print $5 }' 2>/dev/null)

if [ -z "$IFACE" ]; then
  echo "No Connection"
  echo "No Connection"
  echo "#FF0000"
  sleep 10
  exit 0
fi

format() {
  local bytes=$1
  local kib=$(( bytes >> 10 ))
  if [ $kib -lt 0 ]; then
    echo "0K"
  elif [ $kib -gt 1024 ]; then
    local mib_int=$(( kib >> 10 ))
    local mib_dec=$(( kib % 1024 * 976 / 10000 ))
    if [ "$mib_dec" -lt 10 ]; then
      mib_dec="0${mib_dec}"
    fi
    echo "${mib_int}.${mib_dec}M"
  else
    echo "${kib}K"
  fi
}

RX1=$(cat "/sys/class/net/${IFACE}/statistics/rx_bytes")
TX1=$(cat "/sys/class/net/${IFACE}/statistics/tx_bytes")

sleep 1s

RX2=$(< "/sys/class/net/${IFACE}/statistics/rx_bytes")
TX2=$(< "/sys/class/net/${IFACE}/statistics/tx_bytes")

RXDIFF=$(( RX2 - RX1 ))
TXDIFF=$(( TX2 - TX1 ))

echo "UP $(format $TXDIFF) DN $(format $RXDIFF)"
