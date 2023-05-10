#!/bin/bash

# Define menu options
options=("Use Nvidia" "Use AMD")

# Prompt user to choose an option
chosen=$(printf '%s\n' "${options[@]}" | rofi -dmenu -p "Choose GPU")

# Execute corresponding script based on user's choice
case $chosen in
    "Use Nvidia")
        /home/willwitcher/scripts/use_nvidia.sh
        ;;
    "Use AMD")
        /home/willwitcher/scripts/use_amd.sh
        ;;
esac
