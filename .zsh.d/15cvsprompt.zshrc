#!/bin/zsh
autoload -Uz vcs_info

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%{${reset_color}"

function rprompt-cvs
{
    local repo gitdir

    # if [[ "${PWD}" =~ '/\.git(/.*)?$' ]]; then
    if [[ "${PWD}" =~ '/\.git' ]] ; then
        return
    fi

    vcs_info

    ## repository name
    # repo="$(git rev-parse --abbrev-ref HEAD 2> /dev/null)"
    # [ -z ${repo} ] && repo='none'

    # gitdir="$(git rev-parse --git-dir 2> /dev/null)"
    # action="$(VCS_INFO_git_getaction ${gitdir})" && action="$(action)"

    echo ${vcs_info_msg_0_}
}

setopt prompt_subst
RPROMPT='$(rprompt-cvs)'
