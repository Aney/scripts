#!/bin/bash

echo 350 > /sys/class/backlight/intel_backlight/brightness
echo 350 | sudo tee /sys/class/backlight/intel_backlight/brightness 
