#!/bin/bash

battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')

# Check if battery level is below 15%
if [ "$battery_level" -lt 15 ]; then

	# Check if we already notified
	if [ ! -f /tmp/low_battery_notified ]; then
		notify-send "Low Battery" "Battery level is ${battery_level}%"
		touch /tmp/low_battery_notified
	fi
else
	[ -f /tmp/low_battery_notified ] && rm /tmp/low_battery_notified


fi
