#!/bin/zsh
if [ "$(uname)" = "Darwin" ] ; then
    PATH=/usr/local/opt/coreutils/libexec/gnubin:${PATH}
    PATH=${PATH}:/usr/local/bin
    PATH=${PATH}:~/Library/Python/3.11/bin
    PATH=${PATH}:/opt/X11/bin
    PATH="/usr/local/opt/findutils/libexec/gnubin:${PATH}"
    PATH="/opt/homebrew/opt/uutils-coreutils/libexec/uubin:${PATH}"
    PATH="/opt/homebrew/opt/openjdk@17/bin:{$PATH}"
    export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"    
fi

PATH=${PATH}:~/.local/bin
PATH=${PATH}:~/.cask/bin
PATH=${PATH}:~/.cabal/bin
PATH=${PATH}:~/.cargo/bin
PATH=${PATH}:~/node_modules/.bin
PATH=${PATH}:~/.rbenv/bin
PATH=${PATH}:~/Android/Sdk/platform-tools
PATH=${PATH}:~/.google-cloud-sdk/bin

# for OSX (homebrew)
if [ "$(uname)" = "Darwin" ] ; then
    PATH=/usr/local/bin:${PATH}
    PATH=${PATH}:~/Library/Python/3.11/bin
fi

which rbenv > /dev/null && eval "$(rbenv init -)"

PROMPT="%(?.%{%F{magenta}%}.%{%F{red}%})%B%n%F{reset_color}@%(?.%{%F{magenta}%}.%{%F{red}%})%B%m%u%f:%F{green}%d%F{reset_color}%# "

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

export SKIM_DEFAULT_OPTIONS="--reverse"

# wine
export WINEARCH="win32"
export WINEPREFIX="${HOME}/.wine"
export WINEDEBUG="fps"

# firefox
export MOZ_ACCELERATED=1
export MOZ_WEBRENDER=1
