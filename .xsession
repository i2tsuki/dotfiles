#!/bin/sh
exec xbacklight -set 50 &

exec nitrogen --restore &
exec xcompmgr -n &

exec tudor-volumed &
exec blueman-applet &
exec dropbox &
exec ${HOME}/.local/bin/mpdcover &

exec trayer-srg.custom &
exec conky &

# exec xmodmap ${HOME}/.Xmodmaprc &

exec /etc/X11/Sessions/xmonad
