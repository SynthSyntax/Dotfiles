#!/bin/bash

status=$(playerctl --player=YoutubeMusic status 2>/dev/null)

if [[ $status == "Playing" ]]; then
    echo "      "  # pause icon
else
    echo "      "  # play icon
fi
