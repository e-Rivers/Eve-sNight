--   vim:fileencoding=utf-8:foldmethod=marker
--
--   AwesomeWM Tags definition file 
--
--   Author: Emilio Rivers (e-Rivers)

local icons = require("utils.icons")
local awful = require("awful")

local larr = awful.layout.layouts

-- Sets the taglist for each screen
screen.connect_signal("request::desktop_decoration", function(scr)
   local function create_tag(tag_name, workspace_icon, lay_index, is_selected)
      awful.tag.add(
         tag_name,
         {
            icon = workspace_icon,
            layout = larr[lay_index],
            selected = is_selected,
            screen = scr
         }
      )
   end

   -- This setup creates 10 tags
   create_tag("1", icons.img.white_w1, 4, true)
   create_tag("2", icons.img.white_w2, 1, false)
   create_tag("3", icons.img.white_w3, 5, false)
   create_tag("4", icons.img.white_w4, 1, false)
   create_tag("5", icons.img.white_w5, 7, false)
   create_tag("6", icons.img.white_w6, 9, false)
   create_tag("7", icons.img.white_w7, 3, false)
   create_tag("8", icons.img.white_w8, 10, false)
   create_tag("9", icons.img.white_w9, 8, false)
   create_tag("0", icons.img.white_w0, 5, false)

end)
