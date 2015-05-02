#!/bin/zsh
## Keybinds
bindkey -e

## Histrory incremental search
if zle -la | grep -q '^history-incremental-pattern-search'; then
  bindkey '^R' history-incremental-pattern-search-backward
  bindkey '^S' history-incremental-pattern-search-forward
fi

## Insert last word
bindkey '^]' insert-last-word
