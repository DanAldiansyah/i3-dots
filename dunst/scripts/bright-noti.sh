#!/usr/bin/env bash

# Get percentage
bright=$(brightnessctl -m | cut -d, -f4 | tr -d '%')

notify-send -h string:x-dunst-stack-tag:brightness -h int:value:"$bright" "Brightness" "${bright}% 󰃠"
