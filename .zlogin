#!/bin/sh
export PATH=${PATH}:/opt/bin
export PATH=${HOME}/.local/bin:${HOME}/.cargo/bin:${PATH}

export XDG_DATA_HOME=$HOME/.cache
export XDG_CACHE_HOME=$HOME/.cache
export XDG_RUNTIME_DIR=/var/run/user/$(id -u)

export ACRO_DISABLE_FONT_CONFIG=1

export LANG='ja_JP.UTF-8'
export LC_CTYPE=${LANG}

export GTK2_RC_FILES=${HOME}/.gtkrc-2.0

export LIBVA_DRIVER_NAME="i965"
export LIBVA_DRIVERS_PATH=/usr/lib64/va/drivers

# export VDPAU_DRIVER=va_gl
export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export QT4_IM_MODULE=${QT_IM_MODULE}

[ -z "${SSH_AGENT_PID}" -a -z "${SSH_AUTH_SOCK}" ] && eval "$(ssh-agent)"

export GDK_SCALE=1.2

export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORMTHEME="qt5ct"
true
