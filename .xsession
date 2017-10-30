#!/bin/sh

# GTK3 Application Scaling
export GDK_SCALE=1.2

exec xbacklight -set 50 &

sleep 1
exec nitrogen --restore &
exec xcompmgr -n &
exec blueman-applet &
exec dropbox &
exec conky &
exec parcellite &
exec mpd &
exec /opt/Symantec/symantec_antivirus/savtray &

exec ${HOME}/.local/bin/mpdcover &
exec ${HOME}/.local/bin/trayer-srg.custom &
# exec ${HOME}/.local/bin/firefox-sync &

exec xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" 1 &
exec xinput set-ptr-feedback "SynPS/2 Synaptics TouchPad" 8 2 1 &
exec /etc/X11/Sessions/xmonad
