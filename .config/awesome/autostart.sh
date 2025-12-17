#! /bin/bash

killall flameshot

picom &
flameshot &
xfce4-power-manager &
nitrogen --restore &
lxsession &
#dunst &
#notify-osd &
