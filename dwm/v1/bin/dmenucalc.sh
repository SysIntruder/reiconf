#!/bin/sh

# based on https://github.com/onespaceman/menu-calc

answer=$(echo "$@" | bc -l | sed '/\./ s/\.\{0,1\}0\{1,\}$//')
action=$(echo -e "Copy to clipboard\nClear\nClose" | dmenu -p " = $answer")

case $action in
    "Clear") $0 ;;
    "Copy to clipboard") echo -n "$answer" | xclip -selection clipboard;;
    "Close") ;;
    "") ;;
    *) $0 "$answer $action" ;;
esac
