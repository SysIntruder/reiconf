#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# exec i3

hsetroot -center $HOME/.local/share/backgrounds/wallpaper.png;
tmux a -t default || tmux new -s default -d &
$HOME/bin/dmenupolkit.sh &
$HOME/bin/pray_woi.sh &
dsblocks &
(sleep 1; pkill -RTMIN+4 dsblocks && pkill -RTMIN+5 dsblocks) &
picom -b
exec dwm
