#!/usr/bin/env bash

THEME="$HOME/.config/rofi/music.rasi"

# Get player status
player_status=$(playerctl status 2>/dev/null)

if [ -z "$player_status" ] || [ "$player_status" = "Stopped" ]; then
    artist="No Media"
    title="No Media Playing"
    toggle_icon="󰐊"
else
    artist=$(playerctl metadata artist 2>/dev/null)
    title=$(playerctl metadata title 2>/dev/null)
    
    # Fallback if metadata empty
    [ -z "$artist" ] && artist="Unknown artist"
    [ -z "$title" ] && title="Unknown title"

    # Status Play/Pause
    if [ "$player_status" = "Playing" ]; then
        toggle_icon="󰏤"
    else
        toggle_icon="󰐊"
    fi
fi

# Main icon
play="󰐊"
pause="󰏤"
next="󰒭"
prev="󰒮"
stop="󰓛"

# Options
menu_options="$prev\n${toggle_icon}\n$next\n$stop"

# Chosen
chosen=$(echo -e "$menu_options" | rofi -dmenu -p "$artist" -mesg "title: $title" -theme "$THEME")

# Actions
case "$chosen" in 
    *"$play"* | *"$pause"*)
        playerctl play-pause
        ;;
    *"$next"*)
        playerctl next
        ;;
    *"$prev"*)
        playerctl previous
        ;;
    *"$stop"*)
        playerctl stop
        ;;
esac