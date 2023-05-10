#!/usr/bin/env bash

notify-send "Getting list of available Bluetooth devices..."
# Get a list of available Bluetooth devices and morph it into a nice-looking list
bluetooth_list=$(bluetoothctl devices | awk '{print $2 " " $3}' | sed 's/\"//g' | sed 's/\n/ /g')

connected=$(bluetoothctl show | grep "Powered: yes" | wc -l)
if [[ "$connected" -gt 0 ]]; then
	toggle="  Disable Bluetooth"
else
	toggle="  Enable Bluetooth"
fi

# Use rofi to select Bluetooth device
chosen_device=$(echo -e "$toggle\n$bluetooth_list" | uniq -u | rofi -dmenu -i -selected-row 1 -p "Bluetooth Device: " )
# Get name of device
chosen_id=$(echo "${chosen_device:3}" | xargs)

if [ "$chosen_device" = "" ]; then
	exit
elif [ "$chosen_device" = "  Enable Bluetooth" ]; then
	bluetoothctl power on
elif [ "$chosen_device" = "  Disable Bluetooth" ]; then
	bluetoothctl power off
else
	# Message to show when connection is activated successfully
	success_message="You are now connected to the Bluetooth device \"$chosen_id\"."
	# Connect to the selected device
	bluetoothctl connect "$chosen_id" | grep "Connection successful" && notify-send "Connection Established" "$success_message"
fi
