#! /bin/bash

volume="$(amixer get Master | sed 6!d | cut -d'[' -f2 | cut -d']' -f1)"
mem="$(free -h | sed 2!d | cut -d'i' -f2 | sed 's/^[ \t]*//')"
cpu="$(~/.config/awesome/cpu | sed 1!d)"
#bat="$(upower -i /org/freedesktop/UPower/devices/battery_CMB1 | grep percentage | cut -d ' ' -f15)"
#gpu="$(nvidia-smi | sed 9!d | cut -d' ' -f5)"
#echo " 󰇺  $cpu   $mem    $volume    $bat"
echo "󰇺   $cpu     $mem      $volume"
