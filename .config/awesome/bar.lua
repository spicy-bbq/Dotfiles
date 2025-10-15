local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
require('settings')

local confirm_message = wibox.widget {
    text = 'a',
    widget = wibox.widget.textbox
}

local yes = wibox.widget {
    text = 'Yes',
    widget = wibox.widget.textbox
}

local no = wibox.widget {
    text = 'No',
    widget = wibox.widget.textbox
}

local confirm = awful.popup {
    widget = {
        confirm_message,
        {
            yes,
            no,
            layout = wibox.layout.fixed.horizontal
        },
        layout = wibox.layout.fixed.vertical
    },
    ontop = true,
    visible = false
}


-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
    awful.button({ }, 1, function(t) t:view_only() end),
    awful.button({ modkey }, 1, function(t)
        if client.focus then
            client.focus:move_to_tag(t)
        end
    end),
    awful.button({ }, 3, awful.tag.viewtoggle),
    awful.button({ modkey }, 3, function(t)
        if client.focus then
            client.focus:toggle_tag(t)
        end
    end),
    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
)

local tasklist_buttons = gears.table.join(
    awful.button({ }, 1, function (c)
        if c == client.focus then
            c.minimized = true
        else
            c:emit_signal(
                "request::activate",
                "tasklist",
                {raise = true})
        end
    end),
    awful.button({ }, 3, function()
        awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({ }, 4, function ()
        awful.client.focus.byidx(1)
    end),
    awful.button({ }, 5, function ()
        awful.client.focus.byidx(-1)
    end))

awful.screen.connect_for_each_screen(function(s)

    if floating_bar then
        top_padding = screen_padding * 3 + bar_height
    else
        top_padding = screen_padding + bar_height
    end

    s.padding = {
        left = screen_padding,
        right = screen_padding,
        top = top_padding,
        bottom = screen_padding
    }

    -- Each screen has its own tag table.
    workspaces = {}
    for workspace = 1, 9 do
        table.insert(workspaces, workspace_icon)
    end
    awful.tag(workspaces, s, awful.layout.layouts[1])

    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    s.mylayoutbox = wibox.container.margin(s.mylayoutbox, 5, 5, 5, 5)
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.focused,
        buttons = tasklist_buttons,
        widget_template = {
        {
            {
                {
                    {
                        id     = 'icon_role',
                        widget = wibox.widget.imagebox,
                    },
                    margins = 2,
                    widget  = wibox.container.margin,
                },
                {
                    id     = 'text_role',
                    widget = wibox.widget.textbox,
                },
                layout = wibox.layout.fixed.horizontal,
            },
            left  = 5,
            right = 5,
            widget = wibox.container.margin
        },
        id     = 'background_role',
        widget = wibox.container.background,
    },
    }

    if floating_bar then
        bar_x = 20
        bar_y = 10
        bar_shape = gears.shape.rounded_rect
        bar_width_actual = bar_width
    else
        bar_x = 0
        bar_y = 0
        bar_shape = gears.shape.rect
        bar_width_actual = resolution[1]
    end

    s.mywibox = wibox({ 
        --position = 'bottom',
        screen = s,
        height = bar_height,
        width = bar_width_actual,
        ontop = false,
        border_width = bar_border_width,
        border_color = beautiful.border_focus, 
        shape = bar_shape,
        x = bar_x,
        y = bar_y,
        type = 'dock',
    })
    s.mywibox.visible = true

    separator = wibox.widget {
        text = ' ',
        widget = wibox.widget.textbox
    }

    space = wibox.widget {
        text = '   ',
        widget = wibox.widget.textbox
    }

    nightlight_button = wibox.widget {
        text = '󰽥',
        font = 'SauceCodePro Nerd Font 20',
        align = 'center',
        valign = 'center',
        forced_width = 50,
        forced_height = 50,
        widget = wibox.widget.textbox
    }

    nightlight_button:buttons(gears.table.join(
        nightlight_button:buttons(),
        awful.button({}, 1, nil, function()
            confirm_message.text = 'qaaa'
            confirm.visible = true
        end)
    ))

    nightlight_button_container = wibox.widget {
        nightlight_button,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background
    }

    nightlight_button_container:connect_signal('mouse::enter', function(self)
        self.bg = beautiful.bg_normal
        self.fg = beautiful.fg_normal
        self:emit_signal('widget::updated')
    end)

    nightlight_button_container:connect_signal('mouse::leave', function(self)
        self.bg = beautiful.bg_focus
        self.fg = beautiful.fg_focus
        self:emit_signal('widget::updated')
    end)

    refresh_button = wibox.widget {
        text = '',
        font = 'SauceCodePro Nerd Font 20',
        align = 'center',
        valign = 'center',
        forced_width = 50,
        forced_height = 50,
        widget = wibox.widget.textbox
    }

    refresh_button:buttons(gears.table.join(
        refresh_button:buttons(),
        awful.button({}, 1, nil, awesome.restart)
    ))

    refresh_button_container = wibox.widget {
        refresh_button,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background
    }

    refresh_button_container:connect_signal('mouse::enter', function(self)
        self.bg = beautiful.bg_normal
        self.fg = beautiful.fg_normal
        self:emit_signal('widget::updated')
    end)

    refresh_button_container:connect_signal('mouse::leave', function(self)
        self.bg = beautiful.bg_focus
        self.fg = beautiful.fg_focus
        self:emit_signal('widget::updated')
    end)

    lockscreen_button = wibox.widget {
        text = '󰌾',
        font = 'SauceCodePro Nerd Font 20',
        align = 'center',
        valign = 'center',
        forced_width = 50,
        forced_height = 50,
        widget = wibox.widget.textbox
    }

    lockscreen_button:buttons(gears.table.join(
        lockscreen_button:buttons(),
        awful.button({}, 1, nil, function()
            awful.spawn('slock')
        end)
    ))

    lockscreen_button_container = wibox.widget {
        lockscreen_button,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background
    }

    lockscreen_button_container:connect_signal('mouse::enter', function(self)
        self.bg = beautiful.bg_normal
        self.fg = beautiful.fg_normal
        self:emit_signal('widget::updated')
    end)

    lockscreen_button_container:connect_signal('mouse::leave', function(self)
        self.bg = beautiful.bg_focus
        self.fg = beautiful.fg_focus
        self:emit_signal('widget::updated')
    end)

    logout_button = wibox.widget {
        text = '󰍃',
        font = 'SauceCodePro Nerd Font 20',
        align = 'center',
        valign = 'center',
        forced_width = 50,
        forced_height = 50,
        widget = wibox.widget.textbox
    }

    logout_button:buttons(gears.table.join(
        logout_button:buttons(),
        awful.button({}, 1, nil, awesome.quit)
    ))

    logout_button_container = wibox.widget {
        logout_button,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background
    }

    logout_button_container:connect_signal('mouse::enter', function(self)
        self.bg = beautiful.bg_normal
        self.fg = beautiful.fg_normal
        self:emit_signal('widget::updated')
    end)

    logout_button_container:connect_signal('mouse::leave', function(self)
        self.bg = beautiful.bg_focus
        self.fg = beautiful.fg_focus
        self:emit_signal('widget::updated')
    end)

    reboot_button = wibox.widget {
        text = '',
        font = 'SauceCodePro Nerd Font 20',
        align = 'center',
        valign = 'center',
        forced_width = 50,
        forced_height = 50,
        widget = wibox.widget.textbox
    }

    reboot_button:buttons(gears.table.join(
        reboot_button:buttons(),
        awful.button({}, 1, nil, function()
            awful.spawn('reboot')
        end)
    ))

    reboot_button_container = wibox.widget {
        reboot_button,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background
    }

    reboot_button_container:connect_signal('mouse::enter', function(self)
        self.bg = beautiful.bg_normal
        self.fg = beautiful.fg_normal
        self:emit_signal('widget::updated')
    end)

    reboot_button_container:connect_signal('mouse::leave', function(self)
        self.bg = beautiful.bg_focus
        self.fg = beautiful.fg_focus
        self:emit_signal('widget::updated')
    end)

    shutdown_button = wibox.widget {
        text = '󰐥',
        font = 'SauceCodePro Nerd Font Bold 24',
        align = 'center',
        valign = 'center',
        forced_width = 50,
        forced_height = 50,
        widget = wibox.widget.textbox
    }

    shutdown_button:buttons(gears.table.join(
        shutdown_button:buttons(),
        awful.button({}, 1, nil, function()
            awful.spawn('shutdown now')
        end)
    ))

    shutdown_button_container = wibox.widget {
        shutdown_button,
        shape = gears.shape.rounded_rect,
        widget = wibox.container.background
    }

    shutdown_button_container:connect_signal('mouse::enter', function(self)
        self.bg = beautiful.bg_normal
        self.fg = beautiful.fg_normal
        self:emit_signal('widget::updated')
    end)

    shutdown_button_container:connect_signal('mouse::leave', function(self)
        self.bg = beautiful.bg_focus
        self.fg = beautiful.fg_focus
        self:emit_signal('widget::updated')
    end)

    profilepic = wibox.widget {
        image = pfp,
        resize = true,
        forced_height = 80,
        forced_width = 80,
        widget = wibox.widget.imagebox
    }

    username = wibox.widget {
        text = username,
        align = 'center',
        font = 'SauceCodePro Nerd Font Bold 12',
        forced_width = 110,
        widget = wibox.widget.textbox
    }

    profile_container = wibox.widget {
        {
            separator,
            {
                separator,
                profilepic,
                separator,
                layout = wibox.layout.fixed.horizontal,
                spacing = 20,
            },
            username,
            layout = wibox.layout.fixed.vertical,
            spacing = 5
        },
        shape = gears.shape.rounded_rect,
        bg = beautiful.bg_focus,
        fg = beautiful.fg_focus,
        widget = wibox.container.background
    } 

    clock = wibox.widget {
        format = ' %H:\n  %M',
        font = 'SauceCodePro Nerd Font Bold 30',
        forced_width = 130,
        forced_height = 138,
        widget = wibox.widget.textclock
    }

    clock_container = wibox.widget {
        clock,
        shape = gears.shape.rounded_rect,
        bg = beautiful.bg_focus,
        fg = beautiful.fg_focus,
        widget = wibox.container.background
    }
    
    control_center = wibox.widget {
        {
            separator,
            {
                separator,
                nightlight_button_container,
                refresh_button_container,
                lockscreen_button_container,
                separator,
                layout = wibox.layout.fixed.horizontal,
                spacing = 5
            },
            {
                separator,
                logout_button_container,
                reboot_button_container,
                shutdown_button_container,
                separator,
                layout = wibox.layout.fixed.horizontal,
                spacing = 5
            },
            separator,
            layout = wibox.layout.fixed.vertical,
            spacing = 0
        },        
        shape = gears.shape.rounded_rect,
        bg = beautiful.bg_focus,
        fg = beautiful.fg_focus,
        widget = wibox.container.background
    }

    todo = wibox.widget {
       {    
            separator,
            {
                separator,
                wibox.widget {
                    text = 'TODO',
                    font = 'SauceCodePro Nerd Font Bold 20',
                    widget = wibox.widget.textbox,
                },
                awful.widget.watch('bash -c ~/.config/awesome/todo.sh', 30, nil, 
                    wibox.widget {
                        font = 'SauceCodePro Nerd Font Bold 14',
                        widget = wibox.widget.textbox
                    }
                ),
                layout = wibox.layout.fixed.vertical,
                spacing = 0
            },
            layout = wibox.layout.fixed.horizontal,
            spacing = 15
       },
        shape = gears.shape.rounded_rect,
        bg = beautiful.bg_focus,
        fg = beautiful.fg_focus,
        widget = wibox.container.background
    }

    start_menu = awful.popup {
        widget = {
            {
                separator,
                {
                    separator,
                    profile_container,
                    separator,
                    clock_container, 
                    separator,
                    layout = wibox.layout.fixed.vertical,
                    spacing = 0,
                },
                separator,
                {
                    separator,
                    todo, separator,
                    control_center,
                    separator,
                    layout = wibox.layout.fixed.vertical,
                },
                separator,
                layout = wibox.layout.fixed.horizontal,
                spacing = 10
            },
            margins = 0,
            widget = wibox.container.margin
        },
        border_color = beautiful.border_focus, 
        border_width = border,
        shape = gears.shape.rounded_rect,
        ontop = true,
        x = 20,
        y = 50,
        visible = false
    }

    start_button = wibox.widget {
        text = '  >~<  ',
        widget = wibox.widget.textbox
    }

    start_button_container = wibox.widget {
        start_button,
        bg = beautiful.bg_focus,
        fg = beautiful.fg_focus,
        shape = gears.shape.rectangle,
        widget = wibox.container.background
    }

    start_button:buttons(gears.table.join(
        start_button:buttons(),
        awful.button({}, 1, nil, function()
            if start_menu.visible then
                start_menu.visible = false
                start_button_container.shape = gears.shape.rectangle,
                start_button_container:emit_signal("widget::updated")
            else
                start_menu.visible = true
                start_button_container.shape = gears.shape.circle,
                start_button_container:emit_signal("widget::updated")
            end
        end)
    ))

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            start_button_container,
            space,
            s.mytaglist,
            space,
        },
        --wibox.widget.separator(),
        s.mytasklist, -- Middle widget
        { -- Right widgets
            space,
            awful.widget.watch('bash -c ~/.config/awesome/stats.sh', 1),
            wibox.container.margin(wibox.widget.systray(), 5, 5, 5, 5),
            {
                wibox.widget{
                    format = '  %a, %d %b  %H:%M  ',
                    widget = wibox.widget.textclock
                },
                bg = beautiful.bg_focus,
                fg = beautiful.fg_focus,
                widget = wibox.container.background
            },
            --s.mylayoutbox,
            layout = wibox.layout.fixed.horizontal,
        },
    }
end)
