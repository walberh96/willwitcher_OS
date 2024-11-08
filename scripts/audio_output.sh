#!/bin/bash

DEVICE1="alsa_output.usb-Speed_Dragon_USB_Advanced_Audio_Device-00.iec958-stereo"
DEVICE2="alsa_output.pci-0000_0a_00.6.iec958-stereo"

# Get the current default sink
ACTIVE_DEVICE=$(pactl info | grep 'Default Sink' | cut -d ' ' -f3)

# Check which device is active and return the appropriate icon
if [[ "$ACTIVE_DEVICE" == "$DEVICE1" ]]; then
    echo "%{F#00FFFF}  %{F-}"  # Change this to your desired icon for DEVICE1
elif [[ "$ACTIVE_DEVICE" == "$DEVICE2" ]]; then
    echo "%{F#00FFFF} 󰓃 %{F-}"  # Change this to your desired icon for DEVICE2
else
    echo "%{F#808080} 󰟎 %{F-}"    # Gray icon for no active devices
fi
