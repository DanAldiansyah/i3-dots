#!/usr/bin/env bash
# ==========================================================
# Mochi-i3: Media Notification Daemon (Brave Player)
# Path: ~/.config/i3/scripts/music_daemon.sh
# ==========================================================

# Run playerctl follow mode
playerctl -p brave metadata --format '{{status}}: {{title}} - {{artist}}' --follow 2>/dev/null | while read -r line; do
    # Cut status & info
    status=$(echo "$line" | cut -d: -f1)
    info=$(echo "$line" | cut -d: -f2- | sed 's/^ //')

    # Send notification
    if [ "$status" = "Playing" ]; then
        notify-send -h string:x-dunst-stack-tag:music -i dialog-information "󰎆 Now Playing (Brave)" "$info"
    fi
done
