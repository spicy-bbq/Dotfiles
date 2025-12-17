#! /bin/bash

while true
do
	current_time="$(date +%H:%M)"
	current_date="$(date +'%a,%d.%m.%Y')"
	volume="$(amixer get Master | sed 6!d | cut -d'[' -f2 | cut -d']' -f1)"
	mem="$(free -h | sed 2!d | cut -d'i' -f2 | sed 's/^[ \t]*//')"
	cpu="$(~/.config/eww/cpu | sed 1!d)"
    wttr="$(cat ~/.config/eww/wttr.txt)"
    #bat="$(upower -i /org/freedesktop/UPower/devices/battery_CMB1 | grep percentage | cut -d ' ' -f15)"
	#gpu="$(nvidia-smi | sed 9!d | cut -d' ' -f5)"
	#echo " 󰇺 $cpu  $mem  $volume  $bat  $current_date 󰥔 $current_time"
	echo " $wttr 󰇺 $cpu  $mem  $volume  $current_date 󰥔 $current_time"
	sleep 1
done
