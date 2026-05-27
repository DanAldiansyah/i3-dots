#!/usr/bin/env bash

# 1. Wallpaper Dir
WALL_DIR="$HOME/Pictures/i3"

# 2. Theme Dir
THEME="$HOME/.config/rofi/wall.rasi"

# Get wallpaper dir and files
files=$(ls "$WALL_DIR" | grep -E ".jpg$|.png$|.jpeg$")

# Check Dir
if [[ -z "$files" ]]; then
    notify-send "Wallpaper Error" "Folder $WALL_DIR kosong atau tidak ada."
    exit 1
fi

# Chose With Rofi
chosen=$(echo -e "$files" | rofi -dmenu -i -p "Pilih" -theme "$THEME")

# Apply wallpaper
if [[ -n "$chosen" ]]; then
    # Using nitrogen for set wallpaper (zoom-fill)
    nitrogen --set-zoom-fill --save "$WALL_DIR/$chosen"
    
    # Notification (opsional)
    notify-send "Wallpaper" "Berhasil mengganti ke $chosen"
fi
