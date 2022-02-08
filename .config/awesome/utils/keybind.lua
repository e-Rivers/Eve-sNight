--   vim:fileencoding=utf-8:foldmethod=marker
--
--   AwesomeWM keybindings definition file (Both client and global)
--
--   Author: Emilio Rivers (e-Rivers)

local apps = require("utils.apps")
local awful = require("awful")
local naughty = require("naughty")

local HOME = os.getenv("HOME")
local dashboard = require("components.dashboard")

-- Key Definitions
SUPER = "Mod4"
ALT = "Mod1"
SHIFT = "Shift"
CTRL = "Control"

-- General keybindings {{{
awful.keyboard.append_global_keybindings({
    awful.key({ SUPER }, "b", 
        function() 
            s = awful.screen.focused()
            s.dock.visible = not s.dock.visible 
        end,
        {description = "Toggle Panel", group = "AWESOME"}),

    awful.key({ SUPER, ALT }, "l",
        function() 
            awful.spawn.with_shell("light-locker-command -l") 
        end,
        {description = "Lock Screen", group = "GENERAL"}),

    awful.key({ SUPER, CTRL }, "r",
        awesome.restart,
        {description = "Reload awesome", group = "AWESOME"}),

    awful.key({ SUPER }, "Escape",
        function()
            naughty.destroy_all_notifications()
        end,
        { description = "Dismiss notifications", group = "GENERAL" })
})
-- }}}

-- Screenshot keybindings {{{
awful.keyboard.append_global_keybindings({
    awful.key({ SUPER, CTRL }, "s", 
        function() 
            awful.spawn.with_shell("flameshot full -c")
        end,
        {description = "Fullscreen Screenshot to Clipboard", group = "GENERAL"}),

    awful.key({ SUPER, SHIFT }, "s", 
        function() 
            awful.spawn.with_shell("flameshot full -p "..HOME.."/Pictures") 
        end,
        {description = "Fullscreen Screenshot to Pictures", group = "GENERAL"}),

    awful.key({ SUPER, ALT }, "s", 
        function() 
            awful.spawn.with_shell("flameshot gui -p "..HOME.."/Pictures -d 5000")
        end,
        {description = "Custom Area Screenshot with 5 secs delay", group = "GENERAL"}),

    awful.key({ SUPER }, "s", 
        function() 
            awful.spawn.with_shell("flameshot gui -p "..HOME.."/Pictures")
        end,
        {description = "Custom Area Screenshot", group = "GENERAL"})
})
-- }}}

-- Directly open application keybindings {{{
awful.keyboard.append_global_keybindings({
   awful.key({ SUPER }, "Return",
      function()
          awful.spawn(apps.terminal)
      end,
      { description = "Open a terminal", group = "APPS" }),

   awful.key({ SUPER }, "f",
      function() 
          awful.spawn(apps.file_manager) 
      end,
      { description = "Open file manager", group = "APPS" }),

    awful.key({ SUPER }, "i",
        function()
            awful.spawn.single_instance(apps.terminal.." bpytop", {width = 600, height = 600})
        end,
        { description = "Open system monitor", group = "APPS" }),

    awful.key({ SUPER }, "t",
        function()
            awful.spawn.single_instance(apps.terminal.." tty-clock -s -c -B", { floating = true, placement = awful.placement.centered, width = 500, height = 200, ontop = true })
        end,
        { description = "Open TTY clock", group = "APPS" }),

    awful.key({ SUPER }, "p",
        function()
            awful.spawn.single_instance(apps.terminal.." ping 8.8.8.8", { floating = true, placement = awful.placement.centered, width = 500, height = 200 })
        end,
        { description = "Ping to 8.8.8.8 to test connectivity", group = "APPS" })
})
-- }}}

-- Navigation through windows keybindings {{{
awful.keyboard.append_global_keybindings({
   awful.key({ SUPER }, "k",
      function()
          awful.client.focus.byidx(-1)
      end,
      { description = "Gp to next window", group = "CLIENT" }),

   awful.key({ SUPER }, "j",
      function() 
          awful.client.focus.byidx(1) 
      end,
      { description = "Gp to prev window", group = "CLIENT" }),

    awful.key({ SUPER }, "Down",
        function()
            awful.client.focus.bydirection("down")
        end,
        {description = "Focus down", group = "CLIENT"}),

    awful.key({ SUPER }, "Up",
        function()
            awful.client.focus.bydirection("up")
        end,
        {description = "Focus up", group = "CLIENT"}),

    awful.key({ SUPER }, "Left",
        function()
            awful.client.focus.bydirection("left")
        end,
        {description = "Focus left", group = "CLIENT"}),

    awful.key({ SUPER }, "Right",
        function()
            awful.client.focus.bydirection("right")
        end,
        {description = "Focus right", group = "CLIENT"})

})
-- }}}

-- Navigation through tags keybindings {{{
awful.keyboard.append_global_keybindings({
   awful.key({ SUPER, SHIFT }, "j",
      awful.tag.viewnext,
      { description = "Go to next workspace", group = "TAG" }),

   awful.key({ SUPER, SHIFT }, "k",
      awful.tag.viewprev,
      { description = "Go to previous workspace", group = "TAG" }),

   awful.key({ SUPER, SHIFT }, "b",
      awful.tag.history.restore,
      { description = "Go to previous workspace in history", group = "TAG" })
})
local ntags = 10
for i = 1, ntags do
    awful.keyboard.append_global_keybindings({
        -- View tag only.
        awful.key({ SUPER }, "#" .. i + 9,
            function()
                local tag = mouse.screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end,
            {description = "view tag #"..i, group = "TAG"}),

        -- Toggle tag display.
        awful.key({ SUPER, CTRL }, "#" .. i + 9,
            function()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    awful.tag.viewtoggle(tag)
                end
            end,
            {description = "toggle tag #" .. i, group = "TAG"}),

        -- Move client to tag.
        awful.key({ SUPER, SHIFT }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end,
            {description = "move focused client to tag #"..i, group = "TAG"}),

        -- Move all visible clients to tag and focus that tag
        awful.key({ SUPER, "Mod1" }, "#" .. i + 9,
            function()
                local tag = client.focus.screen.tags[i]
                local clients = awful.screen.focused().clients
                if tag then
                    for _, c in pairs(clients) do
                        c:move_to_tag(tag)
                    end
                    tag:view_only()
                end
            end,
            {description = "move all visible clients to tag #"..i, group = "TAG"}),

        -- Toggle tag on focused client.
        awful.key({ SUPER, CTRL, SHIFT }, "#" .. i + 9,
            function()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:toggle_tag(tag)
                    end
                end
            end,
            {description = "toggle focused client on tag #" .. i, group = "TAG"})
        })
end
-- }}}

-- Navigation through screens/monitors keybindings {{{
awful.keyboard.append_global_keybindings({
      -- Move to next and previous screen
      awful.key({ SUPER, CTRL }, "j",
        function()
            awful.screen.focus_relative(1)
        end,
        { description = "Move to next screen", group = "SCREEN"}),

      awful.key({ SUPER, CTRL }, "k",
        function()
            awful.screen.focus_relative(-1)
        end,
        { description = "Move to previous screen", group = "SCREEN"}),


})
-- }}}

-- Window alteration keybindings {{{
client.connect_signal("request::default_keybindings", function()
   -- Full screen
   awful.keyboard.append_client_keybindings({
      -- Move client to screen
      awful.key(
         { SUPER, SHIFT }, "o",
         function(c) 
             c:move_to_screen() 
         end,
         { description = "Move client to next screen", group = "CLIENT" }
      ),
      awful.key({ SUPER, SHIFT }, "f",
         function(c)
            c.fullscreen = not c.fullscreen
            c:raise()
         end,
         { description = "toggle fullscreen", group = "CLIENT" }),

      -- Close window
      awful.key(
         { SUPER, SHIFT }, "q",
         function(c) 
             c:kill()
         end,
         { description = "close", group = "CLIENT" }),

      -- Float toggle
      awful.key(
         { SUPER, CTRL }, "f",
         awful.client.floating.toggle,
         { description = "toggle floating", group = "CLIENT" }),

      -- get master window
      awful.key(
         { SUPER, CTRL }, "Return",
         function(c)
             c:swap(awful.client.getmaster())
         end,
         { description = "move to master", group = "CLIENT" }),

      -- Toggle on top
      awful.key(
         { SUPER }, "o",
         function(c) 
             c.ontop = not c.ontop
         end,
         { description = "toggle keep on top", group = "CLIENT" }),

      -- Toggle on top
      awful.key(
         { SUPER }, "x",
         function(c) 
             c.sticky = not c.sticky
         end,
         { description = "toggle make sticky", group = "CLIENT" }),

      -- Minimize
      awful.key({ SUPER, ALT }, "m",
         function(c)
            c.minimized = true
         end ,
         { description = "minimize", group = "CLIENT" }),

      -- maximize
      awful.key({ SUPER }, "m",
         function(c)
            c.maximized = not c.maximized
            c:raise()
         end ,
         { description = "(un)maximize", group = "CLIENT" }),

      -- maximize vertically
      awful.key({ SUPER, CTRL }, "m",
         function(c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
         end ,
         { description = "(un)maximize vertically", group = "CLIENT" }),

      -- maximize horizontally
      awful.key({ SUPER, SHIFT }, "m",
         function(c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
         end,
         { description = "(un)maximize horizontally", group = "CLIENT" })
   })
end)
-- }}}

-- Rofi keybindings {{{
awful.keyboard.append_global_keybindings({
    awful.key({ SUPER, SHIFT }, "Delete",
        function() 
            awful.spawn.with_shell(HOME.."/.config/rofi/scripts/powermenu.sh")
        end,
        {description = "Display Powermenu (Exit Options)", group = "ROFI"}),

    awful.key({ SUPER }, "a",
        function()
            awful.spawn.with_shell("rofi -show drun -theme themes/eves-night-rofi_launcher.rasi")
        end,
        {description = "Application Launcher", group = "ROFI"}),

    awful.key({ SUPER }, "c",
        function()
            awful.spawn.with_shell("rofi -show calc -modi calc -no-show-match -no-sort -theme themes/eves-night-rofi_calculator.rasi")
        end,
        {description = "Quick Calculator Widget", group = "ROFI"}),

    awful.key({ SUPER }, "Tab",
        function() 
            awful.spawn.with_shell("rofi -show window -theme themes/eves-night-rofi_window.rasi -eh 2")
        end,
        {description = "Show All Opened Apps", group = "ROFI"}),

    awful.key({ SUPER }, "w",
        function() 
            awful.spawn.with_shell(HOME.."/.config/rofi/scripts/rofi-wifi-menu.sh")
        end,
        {description = "Show Wifi Menu", group = "ROFI"}),

    awful.key({ SUPER }, "r", 
        function() 
            awful.spawn.with_shell("rofi -show run") 
        end,
        {description = "Run Prompt", group = "ROFI"})
})
-- }}}

-- Layout selection keybindings {{{
awful.keyboard.append_global_keybindings({
   awful.key({ SUPER }, "space",
      function() 
          awful.layout.inc(1) 
      end,
      { description = "select next", group = "LAYOUT" }),

   awful.key({ SUPER, SHIFT }, "space",
      function() 
          awful.layout.inc(-1) 
      end,
      { description = "select previous", group = "LAYOUT" }),

   awful.key({ SUPER, CTRL}, "u",
      awful.client.urgent.jumpto,
      { description = "jump to urgent client", group = "CLIENT" })
})
-- }}}

-- Master alteration keybindings {{{
awful.keyboard.append_global_keybindings({
   awful.key({ SUPER }, "l",
      function() 
          awful.tag.incmwfact(0.05)  
      end,
      { description = "increase master width factor", group = "LAYOUT" }),

   awful.key({ SUPER }, "h",
      function() 
          awful.tag.incmwfact(-0.05)
      end,
      { description = "decrease master width factor", group = "LAYOUT" }),

   awful.key({ SUPER, SHIFT }, "l",
      function() 
          awful.tag.incnmaster(1, nil, true) 
      end,
      { description = "increase the number of master clients", group = "LAYOUT" }),

   awful.key({ SUPER, SHIFT }, "h",
      function() 
          awful.tag.incnmaster(-1, nil, true) 
      end,
      { description = "decrease the number of master clients", group = "LAYOUT" }),

    awful.key({ SUPER, CTRL }, "l",
        function()
            awful.tag.incncol(1, nil, true)
        end,
        { description = "Increase the number of columns", group = "LAYOUT" }),

    awful.key({ SUPER, CTRL }, "h",
        function()
            awful.tag.incncol(-1, nil, true)
        end,
        { description = "Decrease the number of columns", group = "LAYOUT" })
})
-- }}}

-- Utility keybindings {{{
awful.keyboard.append_global_keybindings({
   awful.key({SUPER}, "d", 
   function()
      if dashboard.visible == false then
         awesome.emit_signal("dashboard::update_info")
         awful.spawn.easy_async_with_shell("sleep 0.1", function(stdout)
             dashboard.visible = true
         end)
      else
         dashboard.visible = false
      end
   end,
   { description = "toggle dashboard", group = "AWESOME" }),

})
-- }}}

-- Audio and brightness keybindings {{{
awful.keyboard.append_global_keybindings({
   awful.key({}, "XF86AudioMic",
      function()
          awful.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle") 
      end,
      { description = "Toggle microphone", group = "AUDIO" }),

   awful.key({}, "XF86AudioMute",
      function() 
        awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle") 
        if dashboard.visible then
            awesome.emit_signal("dashboard::update_info::volume")
        else
            awesome.emit_signal("indicate::volume")
        end
      end,
      { description = "Mute audio", group = "AUDIO" }),

   awful.key({}, "XF86AudioRaiseVolume",
      function() 
          awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%") 
        if dashboard.visible then
            awesome.emit_signal("dashboard::update_info::volume")
        else
            awesome.emit_signal("indicate::volume")
        end
      end,
      { description = "increase volume", group = "AUDIO" }),

   awful.key({}, "XF86AudioLowerVolume",
      function()
          awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")
        if dashboard.visible then
            awesome.emit_signal("dashboard::update_info::volume")
        else
            awesome.emit_signal("indicate::volume")
        end
      end,
      { description = "decrease volume", group = "AUDIO" }),

    awful.key({ }, "XF86MonBrightnessUp", 
        function() 
            awful.spawn.with_shell("brightnessctl set 10%+") 
            if dashboard.visible then
                awesome.emit_signal("dashboard::update_info::brightness")
            else
                awesome.emit_signal("indicate::brightness")
            end
        end,
        {description = "Raise Brightness by 10%", group = "GENERAL"}),

    awful.key({ }, "XF86MonBrightnessDown",
        function() 
            awful.spawn.with_shell("brightnessctl set 10%-")
            if dashboard.visible then
                awesome.emit_signal("dashboard::update_info::brightness")
            else
                awesome.emit_signal("indicate::brightness")
            end
        end,
        {description = "Lower Brightness by 10% Source", group = "GENERAL"})
})
-- }}}

-- Mouse bindings {{{
client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1,
        function(c)
            c:activate { context = "mouse_click" }
        end),
        
        awful.button({ SUPER }, 1, 
        function(c)
            c:activate { context = "mouse_click", action = awful.mouse.client.move(c) }
        end),
        
        awful.button({ SUPER }, 3,
        function(c)
            c:activate { context = "mouse_click", action = awful.mouse.client.resize(c) }
        end)
    })
end)
-- }}}
