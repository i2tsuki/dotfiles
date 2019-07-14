#!/bin/sh

# GTK3 Application Scaling
export GDK_SCALE=1.2
export XDG_CONFIG_HOME="${HOME}/.config"

xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Accel Speed" 1

/usr/bin/bspwm
