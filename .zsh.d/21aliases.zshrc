#!/bin/zsh
## Alias
alias p="popd"

alias ls="ls --color=always"
alias la="ls -la --color=always"
alias ll="ls -la --color=always"

alias grep="grep --color=always"

alias pdflatex="pdfplatex"

# editor
alias vi="/usr/bin/vim"
alias ec="emacsclient -n"
alias ecc="emacsclient -nw"

# git
alias gck="git checkout"
alias gcb="git-current-branch"
alias grc="git rebase --continue"
alias gp="git-pull"

# open
if (which open > /dev/null) ; then
    alias vscode="open -a \"Visual Studio Code\""
else
    alias vscode="visual-studio-code"
fi
