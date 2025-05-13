#!/bin/bash

# Show currently connected network
if [ "$1" == "--list" ]; then
    nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2
    exit
fi

# Launch network selector using rofi or dmenu
CHOSEN=$(nmcli -t -f ssid dev wifi | sort -u | rofi -dmenu -p "Connect to WiFi")

if [ -n "$CHOSEN" ]; then
    nmcli dev wifi connect "$CHOSEN"
fi
