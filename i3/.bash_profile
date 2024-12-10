#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export QT_QPA_PLATFORMTHEME=qt6ct

export GOPATH=$HOME/go
export PATH=$PATH:$HOME/bin:$GOPATH/bin
export TERMINAL=st
export EDITOR=nvim

export RANGER_LOAD_DEFAULT_RC=FALSE

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
