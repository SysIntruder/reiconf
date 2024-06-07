#!/bin/sh

ACTIVE="<span foreground=\"#22BB22\">$BLOCK_INSTANCE</span>"
INACTIVE="<span foreground=\"#888888\"><s>$BLOCK_INSTANCE</s></span>"

if [ "$(systemctl is-active $BLOCK_INSTANCE)" != "active" ]; then
  if [ "$BLOCK_BUTTON" == '1' ]; then
    if $(systemctl start $BLOCK_INSTANCE); then
      echo "$ACTIVE"
    fi
  fi
  echo "$INACTIVE"
else
  if [ "$BLOCK_BUTTON" == '1' ]; then
    if $(systemctl stop $BLOCK_INSTANCE); then
      echo "$INACTIVE"
    fi
  fi
  echo "$ACTIVE"
fi
