#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Pictures/i3-wallpapers"
CACHE_DIR="$HOME/.cache/wallpaper-thumbs"
ROFI_THEME="$HOME/.config/rofi/wall-picker.rasi"

mkdir -p "$CACHE_DIR"

if ! command -v nitrogen &> /dev/null; then
    notify-send "Error" "Nitrogen Not Yet Installed."
    exit 1
fi

# Generate Thumbnail (imagemagick)
generate_thumb() {
    local src="$1"
    local thumb="$2"
    if [ ! -f "$thumb" ] || [ "$src" -nt "$thumb" ]; then
        convert "$src" -resize 500x500^ -gravity center -extent 500x500 "$thumb"
    fi
}

# Scan wallpaper
rofi_input=""
while IFS= read -r img; do
    [ -z "$img" ] && continue
    filename=$(basename "$img")
    thumb="$CACHE_DIR/${filename}.png"
    
    generate_thumb "$img" "$thumb"
    
    rofi_input+="${filename}\0icon\x1f${thumb}\n"
done < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.webp" \))

selected=$(echo -en "$rofi_input" | rofi -dmenu -theme "$ROFI_THEME")

# Apply wallpaper via nitrogen
if [ -n "$selected" ]; then
    full_path="$WALLPAPER_DIR/$selected"
    nitrogen --set-zoom-fill "$full_path" --save
    notify-send "Wallpaper" "Change wallpaper to $selected"
fi