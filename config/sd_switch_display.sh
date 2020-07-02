#!/bin/bash

# If the display is plugged in, change to that.
# If the display is not plugged in, use the laptop display

if [ $1 == 1 ]
then
	xrandr --output VGA-1 --auto --primary --output LVDS-1 --off
else
	xrandr --output LVDS-1 --auto --primary --output VGA-1 --off
fi

feh --bg-scale ~/pictures/wallpapers/mist_forrest.jpg
