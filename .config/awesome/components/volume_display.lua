--   vim:fileencoding=utf-8:foldmethod=marker
--
--   AwesomeWM Volume OSD definition file 
--
--   Author: Emilio Rivers (e-Rivers)

local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local colors = require("theme.colorscheme")
local icons = require("utils.icons")

local bar_width = 300
local bar_height = 40
local screen = awful.screen.focused()

-- The icon element
local volume_icon = wibox.widget {
    forced_width = 25,
    forced_height = 25,
   widget = wibox.widget.imagebox
}

-- The OSD itself
local volume_adjust = wibox {
   screen = awful.screen.focused(),
   x = (screen.geometry.width/2) - (bar_width/2),
   y = screen.geometry.height - (screen.geometry.height / 4),
   width = bar_width,
   height = bar_height,
   bg = colors.backTwo,
   visible = false,
   ontop = true,
}

-- The Percentage bar
local volume_bar = wibox.widget{
   widget = wibox.widget.progressbar,
   color = colors.col_5X,
   background_color = colors.col_6X,
   max_value = 100,
   value = 0
}

-- The volume OSD structure
volume_adjust:setup {
    wibox.container.margin(
        volume_icon, 10, 0, 10, 10
    ),
    {
        wibox.container.margin(
            volume_bar, 10,10,10,10
        ),
        layout = wibox.layout.align.horizontal
    },
    layout = wibox.layout.align.horizontal
}

-- Delay to specify the time the OSD will be active
local activate_delay = gears.timer {
   timeout = 4,
   autostart = true,
   callback = function()
      volume_adjust.visible = false
   end
}

-- Show the OSD when the corresponding signal is received
awesome.connect_signal("indicate::volume",
   function()

       -- Get the value (or if it's muted)
      awful.spawn.easy_async_with_shell(
         "sleep 0.1 && ([ $(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}') = 'no' ] && (pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//') || echo MUTED)",
         -- Set the icon and percentage depending on the value obtained
         function(stdout) 
             if (tonumber(stdout) ~= nil) then

                volume_bar.value = tonumber(stdout)

                if (tonumber(stdout) > 50) then
                    volume_icon.image=gears.surface.load_uncached(icons.img.vol_inc)
                elseif (tonumber(stdout) > 0) then
                    volume_icon.image=gears.surface.load_uncached(icons.img.vol_dec)
                else
                    volume_icon.image=gears.surface.load_uncached(icons.img.vol_mute)
               end
            else
               volume_bar.value = 0
               volume_icon.image=gears.surface.load_uncached(icons.img.vol_mute)
            end
         end
      )

      -- Manage the visibility and resets timer if volume OSD was already active
      if volume_adjust.visible then
         activate_delay:again()
      else
         volume_adjust.visible = true
         activate_delay:start()
      end
   end)
