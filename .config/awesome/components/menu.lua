local beautiful = require('beautiful')
local awful = require('awful')
local gears = require('gears')

local icon = require('utils.icon')
local apps = require('utils.apps')


local menu = awful.menu(
   {
      items = {
         {icon.gylph.launcher .. "Launcher", apps.launcher},
         { icon.gylph.terminal .. "Terminal", apps.terminal },
         { icon.gylph.firefox .. " Browser", apps.browser },
         { icon.gylph.edit .. " Text Editor", apps.text_editor },
         { icon.gylph.folder_open .. "File Manager", apps.file_manager },
      },
   }
)
-- Round corner menu
return menu
