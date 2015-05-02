#!/bin/sh
exec xbacklight -set 50 &
exec ck-launch-session &

exec nitrogen --restore &
exec xcompmgr -n &


exec tudor-volumed &
exec blueman-applet &
exec dropbox &
# exec dhcpcd-gtk &
# exec tracker-control -s &
exec trayer-srgc &
exec conky &

exec xmodmap ${HOME}/.xmodmaprc &

exec /etc/X11/Sessions/xmonad
