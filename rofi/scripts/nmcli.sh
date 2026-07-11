#!/usr/bin/env bash

THEME="$HOME/.config/rofi/wifi.rasi"

if  nmcli radio wifi | grep -q "enabled" ; then
    TOGGLE="󰖪  Turn Off Wi-Fi"
else
    TOGGLE="󰖩  Turn On Wi-Fi"
fi

SCAN_SSIDS=$(nmcli -t -f SIGNAL,SSID device wifi list | sort -n -r | awk -F: '{if($2!="") print $1 " " $2}' | uniq)
LIST_STATIONS=""

while read -r line; do
    if [ ! -z "$line" ]; then
        SIGNAL=$(echo "$line" | awk '{print $1}')
        SSID=$(echo "$line" | cut -d' ' -f2-)
        
        if [ "$SIGNAL" -ge 70 ]; then
            ICON="󰤨 "
        elif [ "$SIGNAL" -ge 40 ]; then
            ICON="󰤥 "
        else
            ICON="󰤟 "
        fi
        
        LIST_STATIONS+="${ICON}  ${SSID}\n"
    fi
done <<< "$SCAN_SSIDS"

MENU_OPTIONS="${TOGGLE}\n${LIST_STATIONS}"
CHOSEN=$(echo -e "$MENU_OPTIONS" | rofi -dmenu -p " Wi-Fi SSID: " -theme "$THEME")

if [ -z "$CHOSEN" ]; then
    exit 0
fi

if [[ "$CHOSEN" == *"Turn Off"* ]]; then
    nmcli radio wifi off
    notify-send -u low "Network Manager" "Disable Wi-Fi "
    exit 0
elif [[ "$CHOSEN" == *"Turn On"* ]]; then
    nmcli radio wifi on
    notify-send -u low "Network Manager" "Enable Wi-Fi "
    exit 0
fi

CHOSEN_SSID=$(echo "$CHOSEN" | cut -d' ' -f4-)
SAVED_CONNECTIONS=$(nmcli -t -f NAME connection show)

if echo "$SAVED_CONNECTIONS" | grep -Fqx "$CHOSEN_SSID"; then
    notify-send "Network Manager" "Connecting to saved network: $CHOSEN_SSID..."
    if nmcli device wifi connect "$CHOSEN_SSID"; then
        notify-send "Network Manager" "Successfully connect to $CHOSEN_SSID"
    else
        nmcli connection delete id "$CHOSEN_SSID" > /dev/null 2>&1
        notify-send -u critical "Network Manager" "Can't connect to $CHOSEN_SSID. Try Again."
    fi
else
    PASSWORD=$(rofi -dmenu -p " Password for $CHOSEN_SSID: " -password -theme "$THEME")
    if [ ! -z "$PASSWORD" ]; then
        notify-send "Network Manager" "Connecting to $CHOSEN_SSID..."
        if nmcli device wifi connect "$CHOSEN_SSID" password "$PASSWORD"; then
            notify-send "Network Manager" "Successfully connect to $CHOSEN_SSID"
        else
            nmcli connection delete id "$CHOSEN_SSID" > /dev/null 2>&1
            notify-send -u critical "Network Manager" "Can't connect, wrong password!"
        fi
    fi
fi
