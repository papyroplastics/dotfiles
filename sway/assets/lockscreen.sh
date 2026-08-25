#!/usr/bin/env bash

assets_dir="$(dirname "$0")"

img_orig="$assets_dir/background.jpg"
img_blur="$(mktemp --suffix=.jpg)"

convert "$img_orig" -filter Gaussian -resize 2% -filter Cubic -resize 5000% "$img_blur"

swaylock \
    --daemonize \
    --ignore-empty-passwor \
    --indicator-radius 120 \
    --indicator-thickness 6 \
    --image "$img_blur" \
    --scaling fill
