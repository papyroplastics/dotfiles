#!/bin/sh

export WLR_RENDERER=vulkan
#export WLR_SCENE_DEBUG_DAMAGE=highlight

export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export XDG_SESSION_TYPE=wayland

export XCURSOR_SIZE=24
export XCURSOR_THEME='Bibata-Modern-Classic'

export QT_QPA_PLATFORMTHEME='qt6ct'

set -o allexport
eval "$(gnome-keyring-daemon 2>/dev/null)"
set +o allexport

exec sway

