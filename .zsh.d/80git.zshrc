#!/bin/zsh
# git-push-wrapper function
function git-push-wrapper()
{
    git-push
}
zle -N git-push-wrapper
bindkey '^g^p' git-push-wrapper
