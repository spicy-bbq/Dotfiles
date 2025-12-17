require('colors')

theme = 'nya'

resolution = {1920, 1080} --width, height

font = 'SauceCode Nerd Font Mono Bold 11'
widget_font = 'SauceCode Nerd Font Mono Bold 12'
big_font = 'SauceCode Nerd Font Mono Bold 30'
medium_font = 'SauceCode Nerd Font Mono Bold 20'

color1 = black -- see colors.lua
color2 = lavender

icon_theme = 'Papirus-Dark'

screen_padding = 5
border = 4
gaps = 10

floating_bar = false
bar_border = 0
bar_height = 32
bar_width = 1870 -- floating only
bar_bottom = false

terminal = 'kitty'
browser = 'chromium'
filemanager = 'pcmanfm'
--run = 'dmenu_run -nb ' .. color2 .. ' -nf ' .. color3 .. ' -sf ' .. color2 .. ' -sb ' .. color1 .. ' -i -l 15 -fn ' .. font .. ' -p Apps: -x 15 -y 52 -z 600 -bw 4'
run = 'dmenu_run'
drun = 'rofi -show drun -hover-select -me-select-entry "" -me-accept-entry MousePrimary -show-icons'
wallpaper = 'nitrogen'

pfp = '/home/shitten/Pictures/marona.png'
username = 'Shitten'

--workspace_icon_normal = ' X '
workspace_icon_normal = ' '
workspace_icon_active = ' '
--workspace_icon_focused = ' 𓆏 '
--workspace_icon_focused = 'ʕ•ᴥ•ʔ'
--workspace_icon_focused = 'ฅ՞•ﻌ•՞ฅ'
--workspace_icon_active = ' O '
workspace_icon_focused = ' '

systray_icon_spacing = 5
disable_tasklist_icon = true

notification_width = 400
notification_height = 80
notification_margin = 50
notification_icon_size = 40

show_titlebar = false

--start_button_text = ' _̴ı̴̴̡̡̡ ̡͌l̡̡̡ ̡͌l̡*̡̡ ̴̡ı̴̴̡ ̡̡͡|̲̲̲͡͡͡ ̲▫̲͡ ̲̲̲͡͡π̲̲͡͡ ̲̲͡▫̲̲͡͡ ̲|̡̡̡ ̡ ̴̡ı̴̡̡ ̡͌l̡̡̡̡. '
start_button_text = '  Nya  '
--bar_message = ' ദ്ദി（• ˕ •マ.ᐟ '
--bar_message_end = 'ฅ^>⩊<^ฅ   '
--bar_message_end = '𐔌՞. .՞𐦯'
bar_message_end = ''
--bar_message_middle = 'ᨒ↟𖠰𖥧˚𖡼𖤣𖥧𖡼𖤣𖥧↟𖠰˚☀︎ᨒ↟𖠰 𖡼.𖤣𖥧𖡼.𖤣𖥧ᨒ↟𖠰𖥧˚ᨒ↟𖠰𖥧˚𖡼𖤣𖥧𖡼𖤣𖥧↟𖠰˚☀︎ᨒ↟𖠰 𖡼.𖤣𖥧𖡼.𖤣𖥧ᨒ↟𖠰𖥧˚ᨒ↟𖠰𖥧˚𖡼𖤣𖥧'
bar_message_middle = '    '
