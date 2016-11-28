#!/bin/sh

set -eu

EXCLUDES="Makefile|LICENSE|clean.sh|install.sh|udev.rules|.git|.gitignore|^.$"

# public
X11ONLY=""
[ "$(uname)" = "Darwin" ] && X11ONLY=".Xmodmap|.xsession|.xinitrc|.xprofile"
for file in $(find . -maxdepth 1 -type f | egrep -v ${EXCLUDES} | egrep -v ${X11ONLY})
do
    ln -sfv $(readlink -f $file) ${HOME}/
done
# secrets
for file in $(find ./secrets -maxdepth 1 -type f | egrep -v ${EXCLUDES})
do
    ln -sfv $(readlink -f $file) ${HOME}/
done
