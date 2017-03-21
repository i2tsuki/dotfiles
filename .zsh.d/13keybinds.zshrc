#!/bin/zsh
## Keybinds
bindkey -e

## Histrory incremental search
if zle -la | grep -q '^history-incremental-pattern-search'; then
  bindkey '^R' history-incremental-pattern-search-backward
fi

## Insert last word
bindkey '^]' insert-last-word

function tmux-set-dirname-window() {
    tmux rename-window ${PWD##*/}
}

zle -N tmux-set-dirname-window
bindkey '^X^E' tmux-set-dirname-window
