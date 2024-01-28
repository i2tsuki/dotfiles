#!/bin/zsh

if [ "$(uname)" = "Darwin" ] ; then
  [ -r /opt/homebrew/etc/profile.d/z.sh ] && . /opt/homebrew/etc/profile.d/z.sh
else
  [ -r ${HOME}/repo/rupa/z/z.sh ] && . ${HOME}/repo/rupa/z/z.sh
fi
