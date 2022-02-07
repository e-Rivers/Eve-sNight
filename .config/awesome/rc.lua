local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")
require("awful.hotkeys_popup.keys")

local home = os.getenv('HOME')
-- Load theme
local current_theme = home .. '/.config/awesome/theme/theme.lua'
beautiful.init(current_theme)

require("utils.layout")

-- Load Wallpapers per tag
awful.screen.connect_for_each_screen(function(s)
    s:connect_signal("tag::history::update", function()
         gears.wallpaper.maximized(home .. "/.config/awesome/theme/wallpapers/wallpaper"..awful.tag.selected().name..".jpg", s, true)
    end)
end)
-- TO LOAD ONLY ONE WALLPAPER ON ALL TAGS
--awful.screen.connect_for_each_screen(function(s)
--     gears.wallpaper.maximized(home .. "/.config/awesome/theme/wallpapers/eve'sNight-wallpaper.jpg")
--end)

-- components
require('components.tag')
require('components.dock')
require('components.volume_display')
require('components.brightness_display')

-- utils
require('utils.autostart')
require('utils.rules')
require('utils.notification')
require('utils.keybind')
require('utils.error_handling')

-- Enable sloppy focus, so that focus follows mouse.
--client.connect_signal("mouse::enter", function(c)
--   c:activate { context = "mouse_enter", raise = false }
--end)

--require('awesome-wallpaper-changer').start({
--	path = '/home/emiliorivers/.config/awesome/theme/wallpapers',
--	show_notify = false,
--	timeout = 5,
--	change_on_click = true
--})
