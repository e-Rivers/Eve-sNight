local awful = require("awful")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi
local icon = require('utils.icon')
local color = require("beautiful.xresources").get_current_theme()

--  widget
local ram = require("widget.ram")
local date = require("widget.date")
local mpd = require('widget.mpd')
local cpu = require('widget.cpu')
local temp = require('widget.temp')
local vol = require('widget.vol')
local wifi = require('widget.wifi')
local hdd = require('widget.hdd')
local net = require('widget.net')

awful.screen.connect_for_each_screen(function(scr)

    --scr.mylayoutbox = awful.widget.layoutbox(scr)
    --scr.mylayoutbox:buttons(gears.table.join(
    --    awful.button({}, 1, function() awful.layout.inc(1) end),
    --    awful.button({}, 3, function() awful.layout.inc(-1) end),
    --    awful.button({}, 4, function() awful.layout.inc(1) end),
    --    awful.button({}, 5, function() awful.layout.inc(-1) end)
    --))

   local bar = awful.wibar {
      position = "top",
      screen = scr
   }

   local btn_tag = awful.button({}, 1, function(t) t:view_only() end)

   local taglist = awful.widget.taglist {
      screen = scr,
      buttons = btn_tag,
      filter = awful.widget.taglist.filter.all,
      widget_template = {
          {
              {
                  {
                      id = "icon_role",
                      widget = wibox.widget.imagebox
                  },
                  left = 5,
                  right = 5,
                  widget = wibox.container.margin
              },
              id = "background_role",
              widget = wibox.container.background
          },
          right = 0,
          widget = wibox.container.margin
      }
   }

   local left = {
      taglist,
      spacing = dpi(10),
      layout = wibox.layout.fixed.horizontal
   }

   local function create_icon(i, c)
      local widget = {
         {
            text = ' ' .. i,
            widget = wibox.widget.textbox
         },
         fg = c,
         widget = wibox.container.background
      }
      return widget
   end

   local date_icon = create_icon(icon.gylph.calendar, color.color4)
   local cpu_icon = create_icon(icon.gylph.heart, color.color1)
   local memory_icon = create_icon(icon.gylph.memory, color.color3)
   local storage_icon = create_icon(icon.gylph.storage, color.color2)
   local wifi_icon = create_icon(icon.gylph.wifi, color.color4)
   local net_icon = create_icon(icon.gylph.signal, color.color6)
   local volume_icon = create_icon(icon.gylph.volume, color.color2)
   local temp_icon = create_icon(icon.gylph.temp, color.color6)


   local right = {
      --net_icon,
      --net.text,
      --storage_icon,
      --hdd.text,
      --wifi_icon,
      --wifi.text,
      --volume_icon,
      --vol.text,
      --temp_icon,
      --temp.text,
      --cpu_icon,
      --cpu.text,
      --memory_icon,
      --ram.text,
      --date_icon,
      --date.text,
      spacing = dpi(10),
      layout = wibox.layout.fixed.horizontal
   }

   bar : setup {
       align = "center",
      {
         left,
         layout = wibox.layout.align.horizontal
      },
      left = 0,
      right = 10,
      widget = wibox.container.margin
   }
end)


