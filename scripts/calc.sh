#!/bin/bash

# Launch calculator (adjust command if needed)
calculator_cmd="gnome-calculator"

# Launch and get PID
$calculator_cmd &
pid=$!

# Wait briefly to ensure window is spawned
sleep 0.5

# Get the window ID of the launched calculator
win_id=$(xdotool search --pid $pid | tail -1)

# Set position (adjust as needed)
xdotool windowmove "$win_id" 1300 684
