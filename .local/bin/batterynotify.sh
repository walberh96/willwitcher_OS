#!/bin/sh

# Send a notification if the laptop battery is either low 
# or is fully charged.

export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

# Battery percentage at which to notify
WARNING_LEVEL=25
BATTERY_DISCHARGING=$(acpi -b | grep "Battery 0" | grep -c "Discharging")
BATTERY_LEVEL=$(acpi -b | grep "Battery 0" | grep -P -o '[0-9]+(?=%)')

# If the battery is low and is not charging (and has not shown notification yet)
if [ "$BATTERY_LEVEL" -le $WARNING_LEVEL ] && [ "$BATTERY_DISCHARGING" -eq 1 ]; then
    notify-send "Low Battery" "${BATTERY_LEVEL}% of battery remaining." -u critical -r 9991
fi
