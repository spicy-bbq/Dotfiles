#! /bin/bash

#edit crunchbang-mini inside shell-color-scripts to add padding

clear
kitty + kitten icat --place 50x50@-50x0 ~/Pictures/nekomatawtfsmall.png
colorscript -e 39
echo -e "▖ ▖    \n▛▖▌▌▌▀▌\n▌▝▌▙▌█▌\n   ▄▌" | 
    gum style --margin "0 25" --bold --border double --width 45 --height 6 \
    --border-foreground "#F28FAD" --foreground "#7aa2f7" --padding "1 2"
    #"   ▖ ▖    \n▛▖▌▌▌▀▌\n▌▝▌▙▌█▌\n▄▌  "
echo
