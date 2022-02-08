--   vim:fileencoding=utf-8:foldmethod=marker
--
--   AwesomeWM Eve'sNight Theme Configuration file
--
--   Author: Emilio Rivers (e-Rivers)

local gears = require("gears")
local awful = require("awful")
local colors = require("theme.colorscheme")
local beautiful = require("beautiful")
local icons = require("utils.icons")

local HOME = os.getenv("HOME")

local theme = {}

-- Wallpaper Theming {{{

-- This setup loads a different wallpaper for each tag
awful.screen.connect_for_each_screen(function(s)
    s:connect_signal("tag::history::update", function()
        gears.wallpaper.maximized(HOME.."/.config/awesome/theme/wallpapers/wallpaper"..awful.tag.selected().name..".jpg", s, true)
    end)
end)

-- This setup loads only one wallpaper for all tags
--awful.screen.connect_for_each_screen(function(s)
--    gears.wallpaper.maximized(HOME.."/.config/awesome/theme/wallpapers/wallpaper1.jpg", s, true)
--end)

-- }}}

-- General Theming {{{

theme.font          = "VictorMono Nerd Font 8"

theme.bg_normal = colors.backTwo
theme.bg_focus = colors.col_6X
theme.bg_urgent = colors.col_2D
theme.bg_minimize = colors.col_2D
theme.bg_systray = colors.col_4D

theme.fg_normal =  colors.white
theme.fg_focus = colors.white
theme.fg_urgent = colors.white
theme.fg_minimize = colors.white

-- }}}

-- Client windows Theming {{{

theme.border_width = 2 
theme.border_normal = colors.backOne
theme.border_focus = colors.col_4D
theme.border_marked = colors.col_2D

theme.useless_gap         = 10

-- }}}

-- Hotkeys Theming {{{

theme.hotkeys_border_color = colors.col_3X
theme.hotkeys_border_width = 10

-- }}}

-- Taglist Theming {{{

theme.taglist_fg_empty = colors.transparent
theme.taglist_bg_empty = colors.transparent

theme.taglist_fg_occupied = colors.transparent
theme.taglist_bg_occupied = colors.col_1D

theme.taglist_fg_focus = colors.transparent
theme.taglist_bg_focus = colors.col_4D

-- }}}

-- Layout Icons {{{

theme.layout_fairh          = icons.img.layout_fairh      
theme.layout_fairv          = icons.img.layout_fairv      
theme.layout_floating       = icons.img.layout_floating   
theme.layout_magnifier      = icons.img.layout_magnifier  
theme.layout_max            = icons.img.layout_max        
theme.layout_fullscreen     = icons.img.layout_fullscreen 
theme.layout_tilebottom     = icons.img.layout_tilebottom 
theme.layout_tileleft       = icons.img.layout_tileleft   
theme.layout_tile           = icons.img.layout_tile       
theme.layout_tiletop        = icons.img.layout_tiletop    
theme.layout_spiral         = icons.img.layout_spiral     
theme.layout_dwindle        = icons.img.layout_dwindle    
theme.layout_cornernw       = icons.img.layout_cornernw   
theme.layout_cornerne       = icons.img.layout_cornerne   
theme.layout_cornersw       = icons.img.layout_cornersw   
theme.layout_cornerse       = icons.img.layout_cornerse   

-- }}}

-- Notifications Theming {{{

theme.notification_border_width = 2
theme.notification_bg = colors.backThree
theme.notification_border_color = colors.col_2D
theme.notification_opacity = 0.9

-- }}}

return theme

