#!/usr/bin/env bash

# 1. Wallpapers DIR (Change if use different folder)
WALL_DIR="$HOME/Pictures/i3-wallpapers"

# 2. THEME DIR
THEME="$HOME/.config/rofi/wall.rasi"

# Get files
files=$(ls "$WALL_DIR" | grep -E ".jpg$|.png$|.jpeg$|.mp4$|.gif$")

# Check DIR
if [[ -z "$files" ]]; then
    notify-send "Wallpaper Error" "$WALL_DIR Empty Or Not Found."
    exit 1
fi

# Chose with Rofi
chosen=$(echo -e "$files" | rofi -dmenu -i -p "Pilih" -theme "$THEME")

# Apply wallpaper
if [[ -n "$chosen" ]]; then
    # nitrogen for set wallpaper (zoom-fill)
    nitrogen --set-zoom-fill --save "$WALL_DIR/$chosen"
    
    # Notification (optional)
    notify-send "Wallpaper" "Change Wallpaper To $chosen"
fi
