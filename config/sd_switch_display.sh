#!/bin/bash

# If the display is plugged in, change to that.
# If the display is not plugged in, use the laptop display

# tail /sys/class/drm/*/status # Connected/Disconnected monitors

if [ $1 == 1 ]
then
	xrandr --output VGA-1 --auto --mode 1600x900 --primary --right-of LVDS-1 --output LVDS-1 --mode 1280x800 --auto
	#xrandr --output VGA-1 --auto --mode 1600x900 --primary --output LVDS-1 --off
elif [ $1 == 2 ]
then
	xrandr --output LVDS-1 --off --output DP-2 --primary --mode 1920x1080 --auto --left-of VGA-1 --output VGA-1 --auto --mode 1600x900 --rotate right 
else
	xrandr --output VGA-1 --off --output DP-2 --off --output LVDS-1 --auto --primary
fi

feh --bg-fill ~/pictures/wallpapers/mist_forrest.jpg


# Switch Caps and Escape

/usr/bin/setxkbmap -option caps:swapescape

# I need this to be only for apple devices...
#/usr/bin/setxkbmap -option altwin:swap_alt_win

# Key Repeat Rate

# xset r rate 280 40 # Defaults
xset r rate 300 50
