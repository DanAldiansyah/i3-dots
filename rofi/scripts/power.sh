#!/usr/bin/env bash

# THEME DIR
THEME="$HOME/.config/rofi/power.rasi"

# Icon Nerd Font
options="  Logout\n  Suspend\n  Reboot\n  Shutdown"

chosen="$(echo -e "$options" | rofi -dmenu -p "Power" -theme "$THEME")"

case "$chosen" in
    *Logout) i3-msg exit ;;
    *Suspend) systemctl suspend ;;
    *Reboot) systemctl reboot ;;
    *Shutdown) systemctl poweroff ;;
esac
