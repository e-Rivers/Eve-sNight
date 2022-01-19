local icon = require('utils.icon')
local awful = require('awful')

local larr = awful.layout.layouts

-- taglist a.k.a workspaces
awful.screen.connect_for_each_screen(function (scr)
   local function create_tag(identifier, workspace_icon, lay_index, is_selected)
      awful.tag.add(
         identifier,
         {
            icon = workspace_icon,
            layout = larr[lay_index],
            selected = is_selected
         }
      )
   end

   create_tag("1", icon.png.white_w1, 4, true)
   create_tag("2", icon.png.white_w2, 1, false)
   create_tag("3", icon.png.white_w3, 5, false)
   create_tag("4", icon.png.white_w4, 1, false)
   create_tag("5", icon.png.white_w5, 7, false)
   create_tag("6", icon.png.white_w6, 9, false)
   create_tag("7", icon.png.white_w7, 3, false)
   create_tag("8", icon.png.white_w8, 10, false)
   create_tag("9", icon.png.white_w9, 8, false)
   create_tag("0", icon.png.white_w0, 5, false)


end)
