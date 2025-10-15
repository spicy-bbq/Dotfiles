require('colors')

theme = 'nya'

resolution = {1920, 1080} --width, height

font = 'SauceCode Nerd Font Bold '
color1 = blue -- see colors.lua
color2 = fullblack
color3 = dark

icon_theme = 'Papirus-Dark'

screen_padding = 10
border = 3
gaps = 5

floating_bar = false
bar_border_width = 0
bar_height = 28
bar_width = 1875 -- floating only

terminal = 'kitty'
browser = 'chromium'
filemanager = 'pcmanfm'
--run = 'dmenu_run -nb ' .. color2 .. ' -nf ' .. color3 .. ' -sf ' .. color2 .. ' -sb ' .. color1 .. ' -i -l 15 -fn ' .. font .. ' -p Apps: -x 15 -y 52 -z 600 -bw 4'
run = 'dmenu_run'
drun = 'rofi -show drun -hover-select -me-select-entry "" -me-accept-entry MousePrimary -show-icons'
wallpaper = 'nitrogen'

pfp = '/home/shitten/Pictures/marona.png'
username = 'Shitten'

workspace_icon = '⏹'

systray_icon_spacing = 5
disable_tasklist_icon = true

notification_width = 400
notification_height = 50
notification_margin = 50
notification_icon_size = 40
