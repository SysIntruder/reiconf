#!/bin/sh

case $BLOCK_BUTTON in
  3) $(i3-msg exec 'st -T "lazydocker" -e lazydocker') ;;
esac

ACTIVE="<span foreground=\"#22BB22\">docker</span>"
INACTIVE="<span foreground=\"#888888\"><s>docker</s></span>"

if [ "$(systemctl is-active docker)" != "active" ]; then
  if [ "$BLOCK_BUTTON" == '1' ]; then
    if $(systemctl start docker); then
      echo "$ACTIVE"
    fi
  fi
  echo "$INACTIVE"
else
  if [ "$BLOCK_BUTTON" == '1' ]; then
    if $(systemctl stop docker); then
      echo "$INACTIVE"
    fi
  fi
  echo "$ACTIVE"
fi
