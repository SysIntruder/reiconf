export QT_QPA_PLATFORMTHEME=qt6ct

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
