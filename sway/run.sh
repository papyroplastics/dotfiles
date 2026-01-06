#!/bin/sh

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export XDG_SESSION_TYPE=wayland

export XCURSOR_SIZE=24
export XCURSOR_THEME='Bibata-Modern-Classic'

export QT_QPA_PLATFORMTHEME='qt6ct'

eval "$(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh 2>/dev/null)"
export SSH_AUTH_SOCK

exec sway

