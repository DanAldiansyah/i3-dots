#!/usr/bin/env bash

THEME="$HOME/.config/rofi/screenshot.rasi"
DIR="$HOME/Pictures/i3_Screenshots"

# make dir
mkdir -p "$DIR"

# Template
filename="%Y-%m-%d-%H%M%S_screenshot.png"

# Option
full="󰹑 "
delay=""
area="󰆟"
window="" 

menu_options="$full\n$area\n$window\n$delay"

chosen=$(echo -e "$menu_options" | rofi -dmenu -mesg "Screenshots DIR: $DIR" -theme "$THEME")

case "$chosen" in
    *"$full"*)
        sleep 0.2
        scrot "$DIR/fullscreen_$filename" -e 'xclip -selection clipboard -t image/png -i $f'
        notify-send "Screenshot Saved" "Full screen successfully saved."
        ;;
    *"$area"*)
        sleep 0.5
        scrot -s -f "$DIR/area_$filename" -e 'xclip -selection clipboard -t image/png -i $f' && notify-send "Screenshot Saved" "The selected area has been successfully saved."
        ;;
    *"$window"*)
        sleep 0.2
        scrot -u -b "$DIR/window_$filename" -e 'xclip -selection clipboard -t image/png -i $f'
        notify-send "Screenshot Saved" "The active window was successfully saved."
        ;;
    *"$delay"*)
        notify-send -t 2000 "Screenshot" "Taking a screenshot in 5 seconds..."
        sleep 5
        scrot "$DIR/delay_$filename" -e 'xclip -selection clipboard -t image/png -i $f'
        notify-send "Screenshot Saved" "Screenshot successfully saved."
        ;;
esac