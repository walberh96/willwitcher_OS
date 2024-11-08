#!/bin/bash

MIC_NAME="Razer Seiren Mini"
ICON_CONNECTED="%{F#00FF00}"  # Green icon for connected and unmuted
ICON_MUTED="%{F#FF0000}"       # Red icon for connected and muted
ICON_DISCONNECTED="%{F#808080}" # Gray icon for disconnected

# Check if the microphone is connected
DEVICE=$(pactl list sources | grep -A 15 "$MIC_NAME")

if [[ -z "$DEVICE" ]]; then
    # Microphone not connected
    echo "$ICON_DISCONNECTED" # Gray icon for disconnected
else
    # Check mute status
    MUTE=$(echo "$DEVICE" | grep 'Mute: yes')

    if [[ -n "$MUTE" ]]; then
        # Microphone is connected and muted
        echo "$ICON_MUTED" # Red icon for muted
    else
        # Microphone is connected and unmuted
        echo "$ICON_CONNECTED" # Green icon for unmuted
    fi
fi
