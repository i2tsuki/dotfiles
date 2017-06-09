#!/bin/zsh

function skim-ssh () {
  local selected_host=$(python3 -c '
import os

with open(os.getenv("HOME") + "/.ssh/config") as f:
    for line in f:
        if line.startswith("Host") and line.find("*") == -1:
            host = line.strip().split(" ", 1)[1]
            print(host)
' | sk --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N skim-ssh
bindkey '^X^L' skim-ssh
