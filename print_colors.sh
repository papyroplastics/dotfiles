#!/usr/bin/env bash

function printcolor {
    local color="$1"
    local len="${2:-3}"
    local padded_color="$(printf "%${len}s" "${color}")"
    echo -en "\e[38;5;${color}m${padded_color} "
}

for color in {0..7}; do
    printcolor "$color" 2
done
echo

for color in {8..15}; do
    printcolor "$color" 2
done
echo

for row in {0..40}; do
    base=$((16 + 6 * row))
    for i in {0..5}; do
        printcolor "$((base + i))"
    done
    echo
done
echo
