#! /bin/sh

dunstctl history | jq -r '.data.[].[] | .message.data | walk(if type == "string" then gsub("</b>|<b>"; "==") | gsub("\n"; " ") + "\n" else . end)' | dmenu -i -f -l 20 -p "Notifications:"
