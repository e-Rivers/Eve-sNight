local dpi = require("beautiful.xresources").apply_dpi
local beautiful = require('beautiful')
local naughty = require('naughty')

naughty.config.padding = beautiful.notification_padding or dpi(20)
naughty.config.defaults.position = "top_right"
naughty.config.defaults.margin = beautiful.notification_margin or dpi(10)
naughty.config.defaults.timeout = 5
naughty.config.defaults.border_width = beautiful.notification_border_width or dpi(0)
