#!/usr/bin/env bash

# Get list of available sinks and morph it into a nice-looking list
output_list=$(pactl list sinks | awk '/Name: /{print " " $2} /Description: /{print "     " $0}' | sed 's/^     //g')

# Use rofi to select output device
chosen_output=$(echo -e "$output_list" | rofi -dmenu -i -selected-row 0 -p "Output: " )
# Get name of output device
chosen_output_id=$(echo "${chosen_output:2}" | xargs)

# If user made a selection, switch to the chosen output device
if [ "$chosen_output" != "" ]; then
    pactl set-default-sink "$chosen_output_id"
    for input in $(pactl list sink-inputs | grep "Sink Input #" | cut -d'#' -f2 | cut -d' ' -f1); do
        pactl move-sink-input "$input" "$chosen_output_id"
    done
fi
