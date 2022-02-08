--   vim:fileencoding=utf-8:foldmethod=marker
--
--   AwesomeWM Brightness OSD definition file 
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
-- IMPORTANT!!!!!!!!!!
-- This was the corresponding max brightness value for my system, yours may be different so check that
-- if you notice a wrong behaviour
local max_bright = 976
local screen = awful.screen.focused()

-- The icon element
local brightness_icon = wibox.widget {
    forced_width = 25,
    forced_height = 25,
   widget = wibox.widget.imagebox
}

-- The brightness OSD itself
local brightness_adjust = wibox {
   screen = awful.screen.focused(),
   x = (screen.geometry.width/2) - (bar_width/2),
   y = screen.geometry.height - (screen.geometry.height / 4),
   width = bar_width,
   height = bar_height,
   bg = colors.backTwo,
   visible = false,
   ontop = true,
}

-- The percentage bar
local brightness_bar = wibox.widget{
   widget = wibox.widget.progressbar,
   color = colors.col_5X,
   background_color = colors.col_6X,
   max_value = max_bright,
   value = 0
}

-- The brightness OSD structure
brightness_adjust:setup {

       wibox.container.margin(
          brightness_icon, 10, 0, 10, 10
       ),
   {
       wibox.container.margin(
         brightness_bar, 10,10,10,10
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
      brightness_adjust.visible = false
   end
}

-- Show the OSD when the corresponding signal is received
awesome.connect_signal("indicate::brightness",
   function()

       -- Get the value
      awful.spawn.easy_async_with_shell(
         "sleep 0.1 && brightnessctl get",
         function(stdout) 
                -- Set the icon and percentage depending on the value obtained
                brightness_bar.value = tonumber(stdout)

                if (tonumber(stdout) > (max_bright/2)) then
                    brightness_icon.image=gears.surface.load_uncached(icons.img.bright_high)
                else
                    brightness_icon.image=gears.surface.load_uncached(icons.img.bright_low)
               end
         end
      )

      -- Manage the visibility and resets timer if brightness OSD was already active
      if brightness_adjust.visible then
         activate_delay:again()
      else
         brightness_adjust.visible = true
         activate_delay:start()
      end
   end)
