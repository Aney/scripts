#!/bin/bash

# cat /sys/class/leds/<keyboard>/max_brightness. Remember that

# Was testing uer input, will change to flag or smth
read TEST
# Change the backlight of the keyboard
echo $TEST | sudo tee /sys/class/leds/smc::kbd_backlight/brightness

# Apparently using Dbus is better
# because it doesn't involve modifications to device files
