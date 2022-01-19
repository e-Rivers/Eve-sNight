local beautiful = require('beautiful')
local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')

client.connect_signal("request::titlebars", function(c)
   local buttons = gears.table.join(
      awful.button({},1,function()
         c:emit_signal("request::activate", "titlebar", {raise = true})
         awful.mouse.client.move(c)
      end),
      awful.button({},3,function()
         c:emit_signal("request::activate", "titlebar", {raise = true})
         awful.mouse.client.resize(c)
      end)
   )

   local titlebar_button = {
      awful.titlebar.widget.closebutton(c),
      awful.titlebar.widget.maximizedbutton(c),
      awful.titlebar.widget.minimizebutton(c),
      spacing = 10,
      layout = wibox.layout.fixed.vertical
   }

   local titlebar_title = {
      {
         align = "center",
         widget = awful.titlebar.widget.titlewidget(c)
      },
      direction = 'west',
      layout = wibox.container.rotate
   }

   awful.titlebar(c, {size = beautiful.titlebar_height, position = 'left'}):setup {
      {
         titlebar_button,
         nil,
         --titlebar_title,
         awful.titlebar.widget.ontopbutton(c),
         layout = wibox.layout.align.vertical
      },
      left = 7,
      right = 7,
      top = 10,
      bottom = 10,
      layout = wibox.container.margin
   }

end)

