#! /bin/sh

# requires single patch
# https://github.com/SysIntruder/dmenu/blob/patched/patches/dmenu-single-5.3.patch

inp=$(printf "s:shutdown\nr:restart\ne:exit\nl:sleep\nk:lock" | dmenu -i -s)
case $inp in
  k:lock)
    slock
    ;;
  l:sleep)
    slock & systemctl suspend
    ;;
  e:exit)
    pkill dwm
    ;;
  r:restart)
    systemctl reboot
    ;;
  s:shutdown)
    systemctl poweroff
    ;;
esac
