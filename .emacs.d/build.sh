#!/bin/sh

set -eu

# Clean elc files
for file in $(find ./init -name '*.elc' -type f)
do
    rm -fv ${file}
done

ELFILE=""
for file in $(find ./init -maxdepth 1 -name '*.el' -type f | grep -v 'tabbar.el')
do
    ELFILE+="$(pwd)/${file#./} "
done
ELFILE="${ELFILE% }"

emacs --batch -l ~/.emacs.d/init.el -f batch-byte-compile ${ELFILE}
