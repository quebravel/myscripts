#!/bin/bash

# https://askubuntu.com/questions/1010405/the-brightness-of-laptop-screen-cannot-be-adjusted-with-either-the-buttons-or-th

# achar saida principal
# xrandr --listactivemonitors

# Step brightness value
STEP=2
# Max brightness value (defult 100)
MAX=100
# Min brightness value (defult 0)
MIN=0

COMMAND=$(xrandr --verbose | egrep -i brightness | cut -f2 -d':' | tr -d "[:space:]")
ACTUAL=$(bc -l <<< $COMMAND*100 | cut -f1 -d'.')

while getopts ": u d" input
do
    case $input in
    u)  if [ $ACTUAL -lt $MAX ];then
                TOTAL=$(bc -l <<< $(($ACTUAL+$STEP))/100)
                $(xrandr --output eDP-1-1 --brightness $TOTAL)
        fi;;
    d)  if [ $ACTUAL -gt $MIN ];then
                TOTAL=$(bc -l <<< $(($ACTUAL-$STEP))/100)
                $(xrandr --output eDP-1-1 --brightness $TOTAL)
        fi;;
    ?)  printf "Usage: brightness [OPTION]\n"
        printf "Increase or decrease birghtness on Ubuntu Xorg.\n" 
        printf "WAYLAND MUST BE DISABLED\n\n"
        printf "  -u\t Increases brightness\n"
        printf "  -d\t Decreases brightness\n"
        exit 2;;
    esac
done
