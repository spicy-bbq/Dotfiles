local awful = require('awful')
local gears = require('gears')
local wibox = require('wibox')
local beautiful = require('beautiful')
require('settings')

if floating_bar then
    bar_padding = screen_padding * 2 + bar_height + gaps
else
    bar_padding = screen_padding + bar_height
end

if floating_bar then
    bar_x = (resolution[1] - bar_width) / 2 - 5
    bar_y = 10
    bar_shape = gears.shape.rounded_bar
    bar_width_actual = bar_width
else
    bar_x = 0
    if bar_bottom then
        bar_y = resolution[2] - bar_height
    else
        bar_y = 0
    end
    bar_shape = gears.shape.rect
    bar_width_actual = resolution[1]
end

taglist_buttons = gears.table.join(
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

tasklist_buttons = gears.table.join(
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
    if bar_bottom then
        s.padding = {
            left = screen_padding,  
            right = screen_padding,
            top = screen_padding,
            bottom = bar_padding
        }
    else 
        s.padding = {
            left = screen_padding,  
            right = screen_padding,
            top = bar_padding,
            bottom = screen_padding
        }
    end

    workspaces = {}
    for workspace = 1, 9 do
        table.insert(workspaces, workspace_icon_normal)
    end
    awful.tag(workspaces, s, awful.layout.layouts[1])

    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    
    s.mylayoutbox = wibox.container.margin(s.mylayoutbox, 5, 5, 5, 5)

    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

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

    s.mywibox = wibox({ 
        --position = 'bottom',
        screen = s,
        height = bar_height,
        width = bar_width_actual,
        ontop = false,
        border_width = bar_border,
        border_color = beautiful.border_normal, 
        shape = bar_shape,
        x = bar_x,
        y = bar_y,
        type = 'dock',
        bg = beautiful.bg_focus,
        fg = beautiful.fg_focus,
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

    start_button = wibox.widget {
        text = start_button_text,
        widget = wibox.widget.textbox
    }

    start_button_container = wibox.widget {
        start_button,
        --bg = beautiful.bg_focus,
        --fg = beautiful.fg_focus,
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

    message_end = wibox.widget {
        text = bar_message_end,
        widget = wibox.widget.textbox
    }

    message_middle = wibox.widget {
        text = bar_message_middle,
        font = big_font,
        widget = wibox.widget.textbox
    }

    calendar = wibox.widget {
        format = '  %a, %d %b  %H:%M   ',
        widget = wibox.widget.textclock
    }

    calendar:buttons(gears.table.join(
        calendar:buttons(),
        awful.button({}, 1, nil, function()
            if calendar_popup.visible then
                calendar_popup.visible = false
            else
                calendar_popup:emit_signal('widget::updated')
                calendar_popup.visible = true
            end
        end)
    ))

    wttr = wibox.widget {
        widget = awful.widget.watch('bash -c ~/.config/awesome/wttr.sh', 7200), --2h
    }

    wttr:buttons(gears.table.join(
        wttr:buttons(),
        awful.button({}, 1, nil, function()
            if wttr_popup.visible then
                wttr_popup.visible = false
            else
                wttr_popup:emit_signal('widget::updated')
                wttr_popup.visible = true
            end
        end)
    ))

    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            separator,
            --start_button_container,
            wibox.container.margin(start_button_container, 0, 0, 5, 5),
            s.mytaglist,
            separator,
            separator,
        },
        --message_middle,
        s.mytasklist,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --wibox.container.margin(wibox.widget.systray(), 5, 5, 5, 5),
            wttr,
            separator,
            separator,
            separator,
            awful.widget.watch('bash -c ~/.config/awesome/stats.sh', 1),
            calendar,
            message_end,
            separator,
            separator,
            separator,
            --s.mylayoutbox,
        },
    }

    function update_focused_tag_name(s)
        current_tag = awful.tag.selected()
    
        for _, tag in ipairs(s.tags) do
            -- # is lemght
            if #tag:clients() > 0 then
                tag.name = workspace_icon_active
            else
                tag.name = workspace_icon_normal
            end
        end

        if current_tag then
            current_tag.name = workspace_icon_focused
        end
    end
    
    awful.screen.connect_for_each_screen(function(s)
        s:connect_signal("tag::history::update", update_focused_tag_name)
        update_focused_tag_name(s)
    end)
end)
