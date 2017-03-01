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

function peco-z-search
{
    which peco z > /dev/null
    if [ $? -ne 0 ]; then
        echo "Please install peco and z"
        return 1
    fi
    local res=$(z | sort -rn | cut -c 12- | peco)
    if [ -n "$res" ]; then
        BUFFER+="cd $res"
        zle accept-line
    else
        return 1
    fi
}
zle -N peco-z-search
bindkey '^X^F' peco-z-search
