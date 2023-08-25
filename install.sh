#!/bin/sh

set -eu

EXCLUDES="vscode|Makefile|LICENSE|clean.sh|install.sh|udev.rules|usr|etc|.config|.git|.gitignore|^.$"

# public
X11ONLY=""
[ "$(uname)" = "Darwin" ] && X11ONLY=".Xmodmap|.xsession|.xinitrc|.xprofile"

if [ "$(uname)" = "Darwin" ] ; then
    for file in $(find . -maxdepth 1 -type f | egrep -v ${EXCLUDES} | egrep -v ${X11ONLY})
    do
        ln -sfv $(readlink -f $file) ${HOME}/
    done
    for file in $(find . -maxdepth 1 -type d | egrep -v ${EXCLUDES} | egrep -v ${X11ONLY})
    do
        ln -sfv $(readlink -f $file) ${HOME}/
    done
else
    for file in $(find . -maxdepth 1 -type f | egrep -v ${EXCLUDES})
    do
        ln -sfv $(readlink -f $file) ${HOME}/
    done
    for file in $(find . -maxdepth 1 -type d | egrep -v ${EXCLUDES})
    do
        ln -sfv $(readlink -f $file) ${HOME}/
    done
fi

# .config
mkdir -pv ${HOME}/.config
for file in $(find .config -mindepth 1 -maxdepth 1)
do
    ln -sfv $(readlink -f $file) ${HOME}/.config/
done

# secrets
if [ -d ./secrets ] ; then
    for file in $(find ./secrets -maxdepth 1 -type f | egrep -v ${EXCLUDES})
    do
        ln -sfv $(readlink -f $file) ${HOME}/
    done
fi

# vscode
if [ "$(uname)" = "Darwin" ] ; then
    ln -sfn $(readlink -f ./vscode/user/settings.json) ${HOME}/Library/Application\ Support/Code/User/settings.json
fi
