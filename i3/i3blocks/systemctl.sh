#!/bin/sh

SERVICE="$SERVICE_NAME"

if [ -z "$SERVICE_NAME" ]; then
  SERVICE="$BLOCK_INSTANCE"
fi

ACTIVE="<span foreground=\"#22BB22\">$SERVICE</span>"
INACTIVE="<span foreground=\"#888888\"><s>$SERVICE</s></span>"

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
