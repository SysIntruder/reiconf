#!/bin/sh

if ! command -v docx2md &> /dev/null
then
  echo "docx2md not found"
  exit 1
fi

FILENAME="$1"

docx2md "$FILENAME" | less
