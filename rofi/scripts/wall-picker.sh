#!/usr/bin/env bash

# Wallpapers directory & theme directory
WALL_DIR="$HOME/Pictures/i3-wallpapers"
THEME="$HOME/.config/rofi/wall-picker.rasi"

# Get img format
MENU_OPTIONS=""
for img in "$WALL_DIR"/*.{png,jpg,jpeg}; do
    if [ -f "$img" ]; then
        basename_img=$(basename "$img")
        # Show img icon
        MENU_OPTIONS+="${basename_img}\x00icon\x1f${img}\n"
    fi
done

# Chose with rofi
CHOSEN=$(echo -e "$MENU_OPTIONS" | rofi -dmenu -p "   Wallpaper " -theme "$THEME")

# Esc for exit
if [ -z "$CHOSEN" ]; then
    notify-send -u low "Wallpaper Selector" "Cancel select wallpapers"
    exit 0
fi

# Set wallpaper with Nitrogen
nitrogen --set-zoom-fill "$WALL_DIR/$CHOSEN" --save

# Notification
notify-send "Wallpaper Selector" "Change Wallpaper to $CHOSEN"
