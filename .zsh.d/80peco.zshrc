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
zle -N peco-execute-history
bindkey '^x^r' peco-execute-history

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
bindkey '^x^p' peco-put-history
