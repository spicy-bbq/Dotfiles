--  ███╗   ██╗██╗   ██╗ █████╗ ██╗    ██╗███████╗██╗   ██╗███╗   ███╗██╗    ██╗███╗   ███╗    
--  ████╗  ██║╚██╗ ██╔╝██╔══██╗██║    ██║██╔════╝██║   ██║████╗ ████║██║    ██║████╗ ████║    
--  ██╔██╗ ██║ ╚████╔╝ ███████║██║ █╗ ██║███████╗██║   ██║██╔████╔██║██║ █╗ ██║██╔████╔██║    
--  ██║╚██╗██║  ╚██╔╝  ██╔══██║██║███╗██║╚════██║██║   ██║██║╚██╔╝██║██║███╗██║██║╚██╔╝██║    
--  ██║ ╚████║   ██║   ██║  ██║╚███╔███╔╝███████║╚██████╔╝██║ ╚═╝ ██║╚███╔███╔╝██║ ╚═╝ ██║    
--  ╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝ ╚═════╝ ╚═╝     ╚═╝ ╚══╝╚══╝ ╚═╝     ╚═╝  

pcall(require, 'luarocks.loader')

local awful = require('awful')
--local naughty = require('naughty')
require('error')
require('theme')
require('layouts')
require('bar')
require('mouse')
require('keybindings')
require('titlebar')
require('rules')

awful.spawn.with_shell('~/.config/awesome/autostart.sh')

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
    -- Set the windows at the slave,
    -- i.e. put it at the end of others instead of setting it master.
    -- if not awesome.startup then awful.client.setslave(c) end

    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        -- Prevent clients from being unreachable after screen count changes.
        awful.placement.no_offscreen(c)
    end
end)

--package.loaded["naughty.dbus"] = {}
--package.loaded["naughty"] = {}
--naughty.disable()
