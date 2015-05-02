#!/bin/zsh
PATH=${PATH}:~/.cask/bin/

PROMPT="%(?.%{${fg[magenta]}%}.%{${fg[red]}%})%B%n%b%f@%F{magenta}%B%m%u%f:%F{green}%d%{${reset_color}%}%# "


LC_ALL='en_US.utf-8'
LANG='en_US.utf-8'

HISTFILE=~/.zsh_history
HISTSIZE=700
SAVEHIST=700
