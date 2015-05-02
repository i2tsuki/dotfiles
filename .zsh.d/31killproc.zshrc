#!/bin/zsh
## Auto complete proc name in kill.
zstyle ':completion:*:processes' command "ps -u $USER"
