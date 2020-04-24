#!/bin/zsh

function skim-execute-history()
{
    local item
    item=$(builtin history -n -r 1 | sk)

    if [[ -z "$item" ]]; then
        return 1
    fi

    BUFFER="$item"
    zle accept-line
}
zle -N skim-execute-history
bindkey '^X^R' skim-execute-history

function skim-put-history()
{
    local item
    item=$(builtin history -n -r 1 | sk)

    if [[ -z "$item" ]]; then
        return 1
    fi

    BUFFER="$item"
    CURSOR=$#BUFFER
}
zle -N skim-put-history
bindkey '^X^P' skim-put-history

function skim-z-search
{
    which sk z > /dev/null
    if [ $? -ne 0 ]; then
        echo "Please install skim and z"
        return 1
    fi
    local res=$(z | sort -rn | cut -c 12- | sk)
    if [ -n "$res" ]; then
        BUFFER+="cd $res"
        zle accept-line
    else
        return 1
    fi
}
zle -N skim-z-search
bindkey '^X^F' skim-z-search

function skim-git-switch
{
    local branch="$(git branch --sort=-authordate | cut -b 3- | grep -v -- '->' | sk)"
    if [ -z "${branch}" ] ; then
        return 1
    fi
    git checkout "${branch}"
    zle accept-line
}
zle -N skim-git-switch
bindkey '^G^N' skim-git-switch
