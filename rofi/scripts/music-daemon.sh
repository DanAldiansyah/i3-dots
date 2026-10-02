#!/usr/bin/env bash

# Run playerctl follow without specifying a particular -p to detect the active player.
playerctl metadata --format '{{playerName}}:{{status}}:{{title}} - {{artist}}' --follow 2>/dev/null | while IFS=: read -r player status info; do
    info=$(echo "$info" | sed 's/^ //')

    if [ "$status" = "Playing" ] && [ -n "$info" ] && [ "$info" != " - " ]; then
        player_name=$(echo "$player" | awk '{print toupper(substr($0,1,1)) lc(substr($0,2))}')
        
        notify-send -h string:x-dunst-stack-tag:music \
                    -u low \
                    "󰎇 Now Playing ($player_name)" \
                    "$info"
    fi
done
