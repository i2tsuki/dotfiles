#!/bin/zsh
PATH=${PATH}:~/.local/bin/
PATH=${PATH}:~/.cask/bin/
PATH=${PATH}:~/node_modules/.bin/

PROMPT="%(?.%{%F{magenta}%}.%{%F{red}%})%B%n%F{reset_color}@%(?.%{%F{magenta}%}.%{%F{red}%})%B%m%u%f:%F{green}%d%F{reset_color}%# "

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
