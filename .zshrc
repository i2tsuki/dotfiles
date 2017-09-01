#!/bin/zsh
fpath=(~/.zsh.d $fpath)
autoload 00init
00init

[ -f ${HOME}/.zshenv ] && . ${HOME}/.zshenv
