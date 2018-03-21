#!/bin/sh

set -eu

exec 2>&1

# rm -f ${HOME}/.emacs.d/el-get/.loaddefs.el
# rm -f ${HOME}/.emacs.d/el-get/.loaddefs.elc
# rm -f ${HOME}/.emacs.d/el-get/.status.el

# rm -rf ./elpa ./elisp

cd $(dirname $(readlink -f ./install.sh))
if [ -d ./el-get ] ; then
    ( cd ./el-get && git pull )
else
    echo "Please git clone el-get (exit 1)"
    exit 1
fi

export EL_GET_COMMAND="el-get-install"

CMD="emacs --batch -q -l ~/.emacs.d/package-install.el"

for i in \
    "init-loader"
do
    EL_GET_PACKAGE=$i $CMD
done

# Auto completion
for i in \
    "fuzzy" \
    "auto-complete" \
    "popup" \
    "pos-tip" \
    "company-mode" \
    "company-quickhelp"
do
    EL_GET_PACKAGE=$i $CMD
done

# Appearance
for i in \
    "color-theme" \
    "smooth-scroll" \
    "powerline" \
    "nyan-mode" \
    "popwin"
do
    EL_GET_PACKAGE=$i $CMD
done

# Input Method
for i in \
    "migemo"
do
    EL_GET_PACKAGE=$i $CMD
done

# Utilities
for i in \
    "exec-path-from-shell" \
    "undo-tree" \
    "stripe-buffer" \
    "htmlize" \
    "yasnippet" \
    "yascroll" \
    "zlc"
do
    EL_GET_PACKAGE=$i $CMD
done

# mew
for i in \
    "mew"
do
    EL_GET_PACKAGE=$i $CMD
done

# flycheck
for i in \
    "flycheck" \
    "flycheck-pos-tip"
do
    EL_GET_PACKAGE=$i $CMD
done

# Documentation tool
for i in \
    "markdown-mode" \
    "org-mode" \
    "org-bullets" \
    "yaml-mode"
do
    EL_GET_PACKAGE=$i $CMD
done
# auctex のビルドには pdftex が必要
# EL_GET_PACKAGE="auctex" $EL_GET_INSTALL_CMD

# ebuild-mode is installed only when ebuild command is available
if (which ebuild > /dev/null) ; then
    EL_GET_PACKAGE="ebuild-mode" $CMD
fi

# Config mode
for  i in \
    "dockerfile-mode" \
    "nginx-mode"
do
    EL_GET_PACKAGE=$i $CMD
done

# Coding
for i in \
    "company-irony" \
    "irony-mode" \
    "cperl-mode" \
    "elpy" \
    "go-mode" \
    "go-autocomplete" \
    "go-eldoc" \
    "groovy-emacs-mode" \
    "haskell-mode" \
    "lua-mode" \
    "company-ghc" \
    "php-mode" \
    "prettier-js" \
    "rust-mode" \
    "flycheck-rust" \
    "rust-racer"
do
    EL_GET_PACKAGE=$i $CMD
done

# User definition
for i in \
    "text-adjust" \
    "mell" \
    "ox-hatena"
do
    EL_GET_PACKAGE=$i $CMD
done

emacs --batch -q -l ~/.emacs.d/package-bundle.el

rm -f ./load-path.el
for file in $(find ./elisp -mindepth 1 -maxdepth 1 -type d)
do
    echo "(add-to-list 'load-path (locate-user-emacs-file \"${file#./}\"))" >> ./load-path.el
done

# Handle exception package
echo "(add-to-list 'load-path (locate-user-emacs-file \"elisp/go-autocomplete/emacs\"))" >> ./load-path.el

# Execute by yourself
echo '(el-get-install "helm")'
echo '(el-get-install "helm-c-yasnippet")'
