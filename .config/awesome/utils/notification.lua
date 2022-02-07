local naughty = require('naughty')
local menubar = require('menubar')
local beautiful = require('beautiful')

-- Defaults
naughty.config.defaults.ontop = true
naughty.config.defaults.icon_size = 30
naughty.config.defaults.timeout = 5
naughty.config.defaults.title = 'System Notification'
naughty.config.defaults.margin = 10
naughty.config.defaults.border_width = 2
naughty.config.defaults.position = 'top_right'
naughty.config.defaults.width = 250 or auto

-- Apply theme variables
naughty.config.padding = 15 -- 20
naughty.config.spacing = 10

-- XDG icon lookup
naughty.connect_signal(
	'request::icon',
	function(n, context, hints)
		if context ~= 'app_icon' then return end

		local path = menubar.utils.lookup_icon(hints.app_icon) or
		menubar.utils.lookup_icon(hints.app_icon:lower())

		if path then
			n.icon = path
		end
	end
)
