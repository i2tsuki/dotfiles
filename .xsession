#!/bin/sh

# GTK3 Application Scaling
export GDK_SCALE=1.2
export XDG_CONFIG_HOME="${HOME}/.config"
xmodmap ~/.Xmodmap
xinput set-prop "TPPS/2 IBM TrackPoint" "libinput Accel Speed" 1
xinput set-ptr-feedback "SynPS/2 Synaptics TouchPad" 8 2 1

/usr/bin/sxhkd &
/usr/bin/bspwm
