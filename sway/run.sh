#!/bin/sh

export XCURSOR_SIZE=24
export QT_QPA_PLATFORMTHEME="qt5ct"

eval "$(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh 2>/dev/null)"
export SSH_AUTH_SOCK

exec sway

