#!/bin/env bash

xrandr --newmod "2560x1080_75.00"  294.00  2560 2744 3016 3472  1080 1083 1093 1130 -hsync +vsync

xrandr --verbose --addmode DisplayPort-1 2560x1080_75.00

xrandr --output DisplayPort-1 --mode 2560x1080_75.00

#$ cvt 2560 1080 75

# Modeline "2560x1080_75.00"  294.00  2560 2744 3016 3472  1080 1083 1093 1130 -hsync +vsync

#$ xrandr --newmode "2560x1080_75.00"  294.00  2560 2744 3016 3472  1080 1083 1093 1130 -hsync +vsync

#$ xrandr -q

#$ xrandr --verbose --addmode DisplayPort-1 2560x1080_75.00

#$ xrandr --output DisplayPort-1 --mode 2560x1080_75.00

# echo "echo 'high' | sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level" >> /etc/rc.conf
