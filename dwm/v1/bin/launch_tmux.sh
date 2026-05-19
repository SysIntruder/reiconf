#!/bin/sh

# autorun tmux
if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s default >/dev/null 2>&1
fi
