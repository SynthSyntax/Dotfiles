#!/bin/bash

# Define the colors for normal and urgent workspaces
NORMAL_COLOR="#282A2E"
URGENT_COLOR="#A54242"  # Red for urgent

# Check if there is an urgent workspace
urgent=$(i3-msg -t get_workspaces | jq '.[] | select(.urgent == true) | .name')

# If there is an urgent workspace, alternate colors every few seconds for flashing
if [ -n "$urgent" ]; then
    # Flashing logic: alternating between red and normal color
    if [ $(date +%s) -gt $(( $(date +%s) / 2 * 2 )) ]; then
        echo "$URGENT_COLOR"
    else
        echo "$NORMAL_COLOR"
    fi
else
    echo "$NORMAL_COLOR"
fi
