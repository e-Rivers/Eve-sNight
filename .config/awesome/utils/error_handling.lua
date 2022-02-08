--   vim:fileencoding=utf-8:foldmethod=marker
--
--   AwesomeWM File to detect startup / configuration errors 
--
--   Author: Emilio Rivers (e-Rivers)

local naughty = require("naughty")
local icons = require("utils.icons")

if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "STARTUP ERROR! Autodestruction initiated...",
        text = awesome.startup_errors
    })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function(e)
        if in_error then
            return
        end
        in_error = true
        naughty.notify({
            icon = icons.img.awesomewm, 
            preset = naughty.config.presets.critical,
            title = "CONFIG ERROR! Autodestruction initiated...",
            text = tostring(e)
        })
        in_error = false
    end)
end
