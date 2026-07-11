#!/usr/bin/env bash
# ==========================================================
# Mochi-i3: Rofi Media Controller Script (Brave Player)
# Path: ~/.config/i3/scripts/music_menu.sh
# ==========================================================

# Theme dir
theme="$HOME/.config/rofi/music.rasi"

# Check status
status=$(playerctl -p brave status 2>/dev/null)

if [ -z "$status" ]; then
    notify-send -u low "Music Player" "Brave (YouTube Music) not active."
    exit 1
fi

# Get metadata
metadata=$(playerctl -p brave metadata --format "󰎈 {{title}} - {{artist}}")

# Option menu
options="󰒮 Prev \n 󰐊 Play / Pause \n 󰒭 Next"

# Chose with rofi
chosen=$(echo -e "$options" | rofi -dmenu -p "$metadata" -theme "$theme")

# Playerctl logic
case "$chosen" in
    *Prev*)
        playerctl -p brave previous
        ;;
    *Play*)
        playerctl -p brave play-pause
        ;;
    *Next*)
        playerctl -p brave next
        ;;
esac
