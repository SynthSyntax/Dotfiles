#!/bin/bash

NOTE_FILE="$HOME/.notepad.txt"

# Load existing note
NOTE=$(cat "$NOTE_FILE" 2>/dev/null)

# Open YAD text editor dialog
NEW_NOTE=$(yad --text="$NOTE" \
    --width=500 --height=400 \
    --title="Quick Notepad" \
    --button="Save":0 --button="Cancel":1 \
    --form --field="Note":TXT)

# If Save pressed
if [[ $? -eq 0 ]]; then
    echo "$NEW_NOTE" > "$NOTE_FILE"
fi
