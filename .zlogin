#!/bin/sh
alias mkr="${HOME}/.go/bin/mkr"

eval "$(dbus-launch --sh-syntax --exit-with-session)"

export PATH=${PATH}:/opt/bin:${HOME}/.cabal/bin:${HOME}/.local/bin:${HOME}/.cask/bin:${HOME}/.cargo/bin

export XDG_DATA_HOME=$HOME/.cache
export XDG_CACHE_HOME=$HOME/.cache

export ACRO_DISABLE_FONT_CONFIG=1

export LANG='ja_JP.UTF-8'
export LC_CTYPE=${LANG}

export GTK2_RC_FILES=${HOME}/.gtkrc-2.0

export LIBVA_DRIVER_NAME="i965"
export LIBVA_DRIVERS_PATH=/usr/lib64/va/drivers

# export VDPAU_DRIVER=va_gl
# eval $(gnome-keyring-daemon -sd)

export XMODIFIERS="@im=fcitx"
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export QT4_IM_MODULE=${QT_IM_MODULE}

# eval "$(gpg-agent)"
[ -z "${SSH_AGENT_PID}" ] && eval "$(ssh-agent)"
