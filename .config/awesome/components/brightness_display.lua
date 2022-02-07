-- ===================================================================
-- Initialization
-- ===================================================================

local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local colors = require("theme.colorscheme")
local icons = require("utils.icon")

local bar_width = 300
local bar_height = 40
local max_bright = 976
local screen = awful.screen.focused()

-- ===================================================================
-- Appearance & Functionality
-- ===================================================================


local volume_icon = wibox.widget {
    forced_width = 25,
    forced_height = 25,
   widget = wibox.widget.imagebox
}

-- create the volume_adjust component
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

local volume_bar = wibox.widget{
   widget = wibox.widget.progressbar,
   color = colors.col_5X,
   background_color = colors.col_6X,
   max_value = max_bright,
   value = 0
}

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

-- create a 4 second timer to hide the volume adjust
-- component whenever the timer is started
local hide_volume_adjust = gears.timer {
   timeout = 4,
   autostart = true,
   callback = function()
      volume_adjust.visible = false
   end
}

-- show volume-adjust when "volume_change" signal is emitted
awesome.connect_signal("indicate::brightness",
   function()

      -- set new volume value
      awful.spawn.easy_async_with_shell(
         "sleep 0.1 && brightnessctl get",
         function(stdout) 

                volume_bar.value = tonumber(stdout)

                if (tonumber(stdout) > (max_bright/2)) then
                    volume_icon.image=gears.surface.load_uncached(icons.png.bright_high)
                else
                    volume_icon.image=gears.surface.load_uncached(icons.png.bright_low)
               end
         end
      )

      -- make volume_adjust component visible
      if volume_adjust.visible then
         hide_volume_adjust:again()
      else
         volume_adjust.visible = true
         hide_volume_adjust:start()
      end
   end)
