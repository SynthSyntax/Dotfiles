#!/bin/bash

# Show Bluetooth status
if [ "$1" == "--status" ]; then
    POWERED=$(bluetoothctl show | grep "Powered" | awk '{print $2}')
    
    if [ "$POWERED" == "yes" ]; then
        # Get MAC addresses of connected devices
        CONNECTED_DEVICES=$(bluetoothctl paired-devices | cut -d ' ' -f2 | while read -r MAC; do
            if bluetoothctl info "$MAC" | grep -q "Connected: yes"; then
                bluetoothctl info "$MAC" | grep "Name" | cut -d ' ' -f2-
                break
            fi
        done)

        if [ -n "$CONNECTED_DEVICES" ]; then
            echo " $CONNECTED_DEVICES"
        else
            echo " On"
        fi
    else
        echo " Off"
    fi
    exit
fi

# On click: open GUI manager or fallback to TUI
bluetooth_cmd="blueman-manager"
$bluetooth_cmd &
