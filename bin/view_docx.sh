#!/bin/sh

if ! command -v docx2txt &> /dev/null
then
  echo "docx2txt not found"
  exit 1
fi

FILENAME="$1"

docx2txt < "$FILENAME" | less
