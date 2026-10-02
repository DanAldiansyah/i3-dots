#!/usr/bin/env bash

# THEME DIR
THEME="$HOME/.config/rofi/power.rasi"

# Icon Nerd Font
logout="󰍃"
suspend=""
reboot=""
shutdown=""

options="$logout\n$suspend\n$reboot\n$shutdown"
username=$(whoami)
uptime="$(uptime -p | sed -e 's/up //g')"

chosen="$(echo -e "$options" | rofi -dmenu -p "Goodbye $username!" -mesg "Uptime: $uptime" -theme "$THEME")"

case "$chosen" in
*"$logout") i3-msg exit ;;
*"$suspend") systemctl suspend ;;
*"$reboot") systemctl reboot ;;
*"$shutdown") systemctl poweroff ;;
esac