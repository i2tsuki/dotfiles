#!/bin/sh
exec xbacklight -set 50 &

exec nitrogen --restore &
exec xcompmgr -n &
exec tudor-volumed &
exec blueman-applet &
exec dropbox &
exec conky &

exec ${HOME}/.local/bin/mpdcover &
exec ${HOME}/.local/bin/trayer-srg.custom &
exec ${HOME}/.local/bin/firefox-sync &

# exec xmodmap ${HOME}/.Xmodmaprc &

exec /etc/X11/Sessions/xmonad
