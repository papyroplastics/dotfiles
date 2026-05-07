#!/usr/bin/env bash

image="$(grimshot save output "$(mktemp --suffix=.png)")"

convert "$image" -filter Gaussian -resize 10% -filter Cubic -resize 1000% "$image"

echo "$image"

