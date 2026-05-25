#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export GOPATH=$HOME/go
export TERMINAL=st
export EDITOR=nvim
export SUDO_ASKPASS=$HOME/bin/dmenu_askpass

if [[ -z "$TMUX" ]]; then
  export PATH=$PATH:$HOME/bin:$HOME/.local/bin:$GOPATH/bin
fi

if [[ -z "$DISPLAY" ]] && [[ "$XDG_VTNR" = 1 ]]; then
  exec startx &>/dev/null
fi
