#!/bin/sh

set -eu

EXCLUDES="Makefile|LICENSE|install.sh|udev.rules|.git|.gitignore|^.$"

# public
for file in $(find . -maxdepth 1 -type f | egrep -v ${EXCLUDES})
do
    ln -sfv $(readlink -f $file) ${HOME}/
done
# secrets
for file in $(find ./secrets -maxdepth 1 -type f | egrep -v ${EXCLUDES})
do
    ln -sfv $(readlink -f $file) ${HOME}/
done
