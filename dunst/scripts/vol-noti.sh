#!/usr/bin/env bash

# Get percentage
volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '[0-9]+(?=%)' | head -n 1)
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | grep -o 'yes')

if [ "$mute" = "yes" ]; then
    notify-send -h string:x-dunst-stack-tag:volume -h int:value:0 "Volume" "Muted 󰝟"
else
    notify-send -h string:x-dunst-stack-tag:volume -h int:value:"$volume" "Volume" "${volume}% 󰕾"
fi
