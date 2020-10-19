#!/bin/bash

while true; do

	# Build the status bar
	status_bar=""
	status_bar+=" $USER"
	status_bar+=" $(cat /sys/class/power_supply/BAT0/capacity)%"
	status_bar+=" $( date +"%A %d/%m/%Y %R" )"

	# Set the status bar
	xsetroot -name "$status_bar"
	sleep 1m

done &
