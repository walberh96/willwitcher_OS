#!/bin/bash

# Replace these with your actual device names
DEVICE1="alsa_output.usb-Speed_Dragon_USB_Advanced_Audio_Device-00.iec958-stereo"
DEVICE2="alsa_output.pci-0000_0a_00.6.iec958-stereo"

# Get the current default sink
CURRENT_SINK=$(pactl info | grep 'Default Sink' | awk '{print $3}')

if [ "$CURRENT_SINK" == "$DEVICE1" ]; then
    # If the current sink is DEVICE1, switch to DEVICE2
    pactl set-default-sink "$DEVICE2"
elif [ "$CURRENT_SINK" == "$DEVICE2" ]; then
    # If the current sink is DEVICE2, switch to DEVICE1
    pactl set-default-sink "$DEVICE1"
else
    echo "Error: Current default sink is neither $DEVICE1 nor $DEVICE2"
    exit 1
fi

# Move all currently playing streams to the new default sink
for sink_input in $(pactl list short sink-inputs | awk '{print $1}'); do
    pactl move-sink-input "$sink_input" "$(pactl info | grep 'Default Sink' | awk '{print $3}')"
done

echo "Switched audio output to $(pactl info | grep 'Default Sink' | awk '{print $3}')"
