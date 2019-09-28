#!/bin/sh

export XDG_CONFIG_HOME="${HOME}/.config"

xinput set-prop "ETPS/2 Elantech Touchpad" "libinput Accel Speed" 1

xrdb -merge -I${HOME} ~/.Xresources

/usr/bin/bspwm
