#!/bin/sh

set -eu

# Clean elc files
for file in $(find ./init -name '*.elc' -type f)
do
    rm -fv ${file}
done

ELFILE=""
for file in $(find ./init -name '*.el' -type f -maxdepth 1 | grep -v 'tabbar.el')
do
    ELFILE+="$(pwd)/${file#./} "
done
ELFILE="${ELFILE% }"

emacs --batch -l ~/.emacs.d/init.el -f batch-byte-compile ${ELFILE}
