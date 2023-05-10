#!/usr/bin/env bash

# Get list of available sources and morph it into a nice-looking list
input_list=$(pactl list sources | awk '/Name: /{print " " $2} /Description: /{print "     " $0}' | sed 's/^     //g')

# Use rofi to select input device
chosen_input=$(echo -e "$input_list" | rofi -dmenu -i -selected-row 0 -p "Input: " )
# Get name of input device
chosen_input_id=$(echo "${chosen_input:2}" | xargs)

# If user made a selection, switch to the chosen input device
if [ "$chosen_input" != "" ]; then
    pactl set-default-source "$chosen_input_id"
fi
