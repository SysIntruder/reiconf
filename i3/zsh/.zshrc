source "${ZDOTDIR}/.zshenv"
source "${ZDOTDIR}/.alias"

HISTFILE=$ZDOTDIR/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

setopt notify autocd nomatch
unsetopt beep extendedglob notify

KEYTIMEOUT=1
VIM_MODE_NO_DEFAULT_BINDINGS=true
bindkey -v

# Text only
vim_ins_mode="%BINSERT%b"
vim_cmd_mode="%BNORMAL%b"

# With lines
# vim_ins_mode="[INSERT]─"
# vim_cmd_mode="[NORMAL]─"

# Bar
# vim_ins_mode="%B%K{#62A0EA}%F{#1E1E1E} INSERT %f%k%b"
# vim_cmd_mode="%B%K{#62A0EA}%F{#1E1E1E} NORMAL %f%k%b"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

source "${ZDOTDIR}/git-prompt.sh"
GIT_PS1_DESCRIBE_STYLE='contains'
GIT_PS1_SHOWCOLORHINTS='y'
GIT_PS1_SHOWDIRTYSTATE='y'
GIT_PS1_SHOWSTASHSTATE='y'
GIT_PS1_SHOWUNTRACKEDFILES='y'
GIT_PS1_SHOWUPSTREAM='auto'

setopt PROMPT_SUBST

# Text only
PROMPT='${vim_mode} %F{blue}%2~%f$(__git_ps1 " %s") '

# With lines
# PROMPT='${vim_mode}[%F{blue}%2~%f]$(__git_ps1 "─[%s]") '

# Bar
# PROMPT='${vim_mode}%K{#303030} %2~ %k%K{#242424}$(__git_ps1 " %s ")%k '

zstyle :compinstall filename "${ZDOTDIR}/.config/zsh/.zshrc"
zstyle ':completion:*' menu select

setopt COMPLETE_ALIASES

autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mH+24) ]]; then
    compinit
else
    compinit -C
fi

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux a -t default || exec tmux new -s default && exit;
fi
