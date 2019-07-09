#!/bin/bash

set -eux

install -m 0644 ./usr/share/xsessions/bspwm-gnome-xsession.desktop /usr/share/xsessions/bspwm-gnome.desktop
install -m 0644 ./usr/share/applications/bspwm-gnome.desktop -D /usr/share/applications/bspwm-gnome.desktop
install -m 0644 ./usr/share/gnome-session/sessions/bspwm-gnome.session -D /usr/share/gnome-session/sessions/bspwm-gnome.session
install -m 0755 ./usr/bin/bspwm-gnome -D /usr/bin/bspwm-gnome
install -m 0755 ./usr/bin/gnome-session-bspwm /usr/bin/gnome-session-bspwm
