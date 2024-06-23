#!/bin/bash
#Airpods
echo 'Connecting Airpods'
bluetoothctl connect MAC_AIRPODS &

#Jabra Headset
#Must remove and reconnect to be able to connect
echo 'Removing Jabra'
bluetoothctl remove MAC_JABRA

echo 'Scanning'
# Start scanning for devices in the background
bluetoothctl scan on & > /dev/null
scan_pid=$!

# Sleep for 2 seconds
sleep 2

echo "kill $scan_pid"
# Kill the bluetoothctl process handling scan after 5 seconds
# This assumes the bluetoothctl process ID is stored in $!
kill scan_pid &> /dev/null

bluetoothctl connect MAC_JABRA
bluetoothctl scan off
