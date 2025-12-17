#! /bin/bash

while true 
do
    echo "  $(curl -s wttr.in/$(cat ~/.config/eww/location.txt)?format='%C+%f')" > ~/.config/eww/wttr.txt
    sleep 7200
done
