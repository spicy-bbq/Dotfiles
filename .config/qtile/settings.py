from libqtile import hook
from colors import *

@hook.subscribe.startup
def get_colors():
    color1 = blue
    color2 = fullblack
    color3 = white
    return[color1, color2, color3]

follow_mouse_focus = True
bring_front_click = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = False
wmname = "QUwUtile"

mod = 'mod4'
terminal = 'kitty'
filemanager = 'pcmanfm'
termfilemanager = 'ranger'
browser = 'chromium'
