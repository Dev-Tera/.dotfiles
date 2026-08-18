#!/bin/bash
# Prints battery percentage for hyprlock

bat=/sys/class/power_supply/BAT0
[[ -d $bat ]] || exit 0

capacity="$(< "$bat/capacity")"
status="$(< "$bat/status")"

if [[ $status == "Charging" ]]; then
    echo "$capacity% 󰂄"
else
    echo "$capacity% 󰁹"
fi
