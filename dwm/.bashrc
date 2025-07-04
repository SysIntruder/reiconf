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

source /usr/share/doc/pkgfile/command-not-found.bash

# color
alias ip='ip --color=auto'
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias pacman='pacman --color auto'

# pacman
alias lspac="pacman -Qi | grep -E '^(Name|Installed)' | cut -f2 -d':' | paste - - | column -t | sort -nrk 2 | grep MiB | less"

# safety can be fun
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# prompt
RESET="\[\033[0m\]"
BLUE="\[\033[34;1m\]"
BOLD="\[\033[;1m\]"
PS1='[\u@\h \W]\$ '

# git prompt
source "$HOME/bin/git-prompt.sh"
GIT_PS1_SHOWCOLORHINTS='y'
GIT_PS1_SHOWDIRTYSTATE='y'
GIT_PS1_SHOWSTASHSTATE='y'
GIT_PS1_SHOWUNTRACKEDFILES='y'
GIT_PS1_SHOWUPSTREAM='auto'
PROMPT_COMMAND='__git_ps1 "—[${BLUE}\W${RESET}]" "\\\$ " "—[${BOLD}%s${RESET}]"'
# PROMPT_COMMAND='__git_ps1 "[\u@\h \W" "]\\\$ "'

# pnpm
export PNPM_HOME="/home/rei/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
