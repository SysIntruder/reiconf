#! /bin/sh

# based on dmenu-desktoponly patch

dirs="
/usr/share/applications
/usr/local/share/applications
$HOME/.local/share/applications
"

stest -fl $dirs | grep -v 'mimeinfo.cache' | sed 's/\.[^./]*$//' | sort -u | dmenu -i "$@" | xargs gtk-launch &
