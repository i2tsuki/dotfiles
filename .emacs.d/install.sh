#!/bin/sh

set -u

# rm -rfv ./elpa ./elisp
rm -fv ./load-path.el

emacs --batch -l ~/.emacs.d/package-install.el

for file in $(find ./elisp -mindepth 1 -maxdepth 1 -type d)
do
    echo "(add-to-list 'load-path (locate-user-emacs-file \"${file#./}\"))" >> ./load-path.el
done

# handle exception
echo "(add-to-list 'load-path (locate-user-emacs-file \"elisp/go-autocomplete/emacs\"))" >> ./load-path.el
