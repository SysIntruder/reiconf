#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# settings
export HISTCONTROL="erasedups:ignorespace"
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist
shopt -s autocd
shopt -s checkwinsize
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'
bind '"\e[Z":menu-complete-backward'
source /usr/share/doc/pkgfile/command-not-found.bash

# color
alias ip='ip --colot=auto'
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias pacman='pacman --color=auto'

# pacman
alias lspac="pacman -Qi | egrep '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | less"

# safety can be fun
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# shenanigans
alias fetch='inxi -SBCGNDI'

# prompt
RESET="\[\033[0m\]"
BLUE="\[\033[34;1m\]"
PS1='[\u@\h \W]\$ '

# git prompt
source "$HOME/bin/git-prompt.sh"
GIT_PS1_SHOWCOLORHINTS='y'
GIT_PS1_SHOWDIRTYSTATE='y'
GIT_PS1_SHOWSTASHSTATE='y'
GIT_PS1_SHOWUNTRACKEDFILES='y'
GIT_PS1_SHOWUPSTREAM='auto'
PROMPT_COMMAND='__git_ps1 "${BLUE}\W${RESET}" " \\\$ "'

# nvm
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# autorun tmux
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi
