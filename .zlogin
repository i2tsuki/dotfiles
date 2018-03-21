#!/bin/sh
alias mkr="${HOME}/.go/bin/mkr"

export PATH=${PATH}:/opt/bin:${HOME}/.cabal/bin:{HOME}/.cask/bin
export PATH=${HOME}/.local/bin:${HOME}/.cargo/bin:${PATH}

export XDG_DATA_HOME=$HOME/.cache
export XDG_CACHE_HOME=$HOME/.cache
export XDG_RUNTIME_DIR=$HOME/tmp

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
[ -z "${SSH_AGENT_PID}" -a -z "${SSH_AUTH_SOCK}" ] && eval "$(ssh-agent)"

export GDK_SCALE=1.2

export XKB_DEFAULT_OPTIONS=ctrl:nocaps,
export QT_AUTO_SCREEN_SCALE_FACTOR=1
# export GDK_BACKEND=wayland
# export QT_QPA_PLATFORM=wayland-egl
export QT_QPA_PLATFORMTHEME="qt5ct"
# export QT_WAYLAND_FORCE_DPI=120
# export SDL_VIDEODRIVER=wayland
# export CLUTTER_PAINT=disable-clipped-redraws:disable-culling
/bin/true
