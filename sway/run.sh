#!/bin/sh

export XCURSOR_SIZE=24
export GTK_MODULES="gail:atk-bridge"
export QT_QPA_PLATFORMTHEME="qt5ct"

eval "$(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh 2>/dev/null)"
export SSH_AUTH_SOCK

/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &

xdg-user-dirs-update &

exec sway

