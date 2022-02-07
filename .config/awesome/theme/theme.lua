---------------------------
-- djancoeg awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local gears = require('gears')
local dpi = xresources.apply_dpi
local color = xresources.get_current_theme ()
local colors = require("theme.colorscheme")
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local HOME = os.getenv("HOME")

local theme = {}

theme.font          = "VictorMono Nerd Font 8"

theme.bg_normal = colors.backTwo
theme.bg_focus = colors.col_6X
theme.bg_urgent = colors.col_2D
theme.bg_minimize = colors.col_2D
theme.bg_systray = colors.col_4D

theme.fg_normal =  color.foreground
theme.fg_focus = color.foreground
theme.fg_urgent = color.foreground
theme.fg_minimize = color.foreground

theme.border_width = 2 
theme.border_normal = colors.backOne
theme.border_focus = colors.col_4D
theme.border_marked = color.col_2D

theme.useless_gap         = 10

-- There are other variable sets
-- overriding the djancoeg one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(0)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
   taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
   taglist_square_size, theme.fg_normal
)

theme.taglist_fg_empty = color.foreground
theme.taglist_bg_empty = colors.transparent

theme.taglist_fg_occupied = color.background
theme.taglist_bg_occupied = colors.col_1D

theme.taglist_fg_focus = color.background
theme.taglist_bg_focus = colors.col_4D

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(25)
theme.menu_width = dpi(180)

theme.menu_border_width = 0
theme.menu_border_radius = dpi(9)
theme.menu_bg_normal = color.background
theme.menu_fg_normal = color.foreground
theme.menu_bg_focus = color.color6
theme.menu_fg_focus = color.background

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
theme.bg_widget = color.background
theme.fg_widget = color.foreground

-- You can use your own layout icons like this:
theme.layout_fairh          = HOME.."/.config/awesome/theme/icons/layouts/fairh.png"
theme.layout_fairv          = HOME.."/.config/awesome/theme/icons/layouts/fairv.png"
theme.layout_floating       = HOME.."/.config/awesome/theme/icons/layouts/floating.png"
theme.layout_magnifier      = HOME.."/.config/awesome/theme/icons/layouts/magnifier.png"
theme.layout_max            = HOME.."/.config/awesome/theme/icons/layouts/max.png"
theme.layout_fullscreen     = HOME.."/.config/awesome/theme/icons/layouts/fullscreen.png"
theme.layout_tilebottom     = HOME.."/.config/awesome/theme/icons/layouts/tilebottom.png"
theme.layout_tileleft       = HOME.."/.config/awesome/theme/icons/layouts/tileleft.png"
theme.layout_tile           = HOME.."/.config/awesome/theme/icons/layouts/tile.png"
theme.layout_tiletop        = HOME.."/.config/awesome/theme/icons/layouts/tiletop.png"
theme.layout_spiral         = HOME.."/.config/awesome/theme/icons/layouts/spiral.png"
theme.layout_dwindle        = HOME.."/.config/awesome/theme/icons/layouts/dwindle.png"
theme.layout_cornernw       = HOME.."/.config/awesome/theme/icons/layouts/cornernw.png"
theme.layout_cornerne       = HOME.."/.config/awesome/theme/icons/layouts/cornerne.png"
theme.layout_cornersw       = HOME.."/.config/awesome/theme/icons/layouts/cornersw.png"
theme.layout_cornerse       = HOME.."/.config/awesome/theme/icons/layouts/cornerse.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
-- theme.icon_theme = nil

theme.notification_border_width = 2
theme.notification_bg = colors.backThree
theme.notification_border_color = colors.col_2D
theme.notification_opacity = 0.9


return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
