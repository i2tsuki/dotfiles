#!/bin/zsh
# peco function

function peco-execute-history()
{
    local item
    item=$(builtin history -n -r 1 | peco)

    if [[ -z "$item" ]]; then
	return 1
    fi

    BUFFER="$item"
    zle accept-line
}
bindkey '^X^R' peco-execute-history
zle -N peco-execute-history

function peco-put-history()
{
    local item
    item=$(builtin history -n -r 1 | peco)

    if [[ -z "$item" ]]; then
    	return 1
    fi

    BUFFER="$item"
    CURSOR=$#BUFFER
}
zle -N peco-put-history
bindkey '^X^P' peco-put-history
