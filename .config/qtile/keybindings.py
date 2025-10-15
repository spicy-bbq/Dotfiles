from libqtile.lazy import lazy
from libqtile.config import Key
from libqtile.dgroups import simple_key_binder
from settings import *

dgroups_key_binder = simple_key_binder(mod)
color1 = get_colors()[0]
color2 = get_colors()[1]
color3 = get_colors()[2]

keys = [
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "Escape", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "space", lazy.spawn("rofi -show drun -hover-select -me-select-entry '' -me-accept-entry MousePrimary -show-icons"), desc="Switch between open apps"),
    Key([mod], "Tab", lazy.spawn("rofi -show window -hover-select -me-select-entry '' -me-accept-entry MousePrimary"), desc="Switch between open apps"),
    Key([mod], "BackSpace", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill()),
    Key([mod, "control"], "Delete", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "End", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawn("dmenu_run -nb " + color2 + " -nf " + color3 + " -sf " + color2 + " -sb " + color1 + " -i -l 15 -fn 'SauceCodePro Nerd Font Bold 12' -p 'Apps: ' -x 15 -y 52 -z 600 -bw 4"), desc="Launch apps"),
    Key([mod], "f", lazy.spawn(filemanager), desc="Launch file manager"),
    Key([mod], "x", lazy.spawn("xkill"), desc="Kill unresponsible application, scroll mouse weel to cancel"),
    Key([mod], "b", lazy.spawn(browser), desc ="Lauch web browser"),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc='toggle floating'),
    Key([mod], "w", lazy.spawn("nitrogen"), desc="Change wallpaper"),
    Key([mod], "F11", lazy.window.toggle_fullscreen(), desc='Toggle fullscreen'),
    Key([], "Print", lazy.spawn("flameshot full"), desc='Takescreenshot'),
    Key([mod], "n", lazy.spawn("fish -c ~/.config/qtile/control-center.sh"), desc='Notifications'),
    Key([mod, "shift"], "n", lazy.spawn("dunstctl close"), desc='Close notification'),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q sset Master 5%+"), desc='Volume +5%'),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q sset Master 5%-"), desc='Volume -5%'),
    Key([], "XF86AudioMute", lazy.spawn("amixer -q sset Master toggle"), desc='Toggle mute'),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-"), desc='Brightness -10%'),
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +5%"), desc='Brightness +10%'),
    Key([mod, "control"], "Escape", lazy.spawn("fish -c ~/.config/qtile/powermenu.sh"), desc='Power menu'),
    Key([mod], "L", lazy.spawn("betterlockscreen -l"), desc='Lock screen'),
    Key([mod], "period", lazy.spawn("rofi -modi emoji -show emoji -hover-select -me-select-entry '' -me-accept-entry MousePrimary"), desc='Launch emoji picker'),
    Key([mod], 'a', lazy.spawn('eww open --toggle nokia')),
]
