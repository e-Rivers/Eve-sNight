--   vim:fileencoding=utf-8:foldmethod=marker
--
--   AwesomeWM Background processes and daemons that execute at startup, ergo,
--   every time Awesome is reloaded
--
--   Author: Emilio Rivers (e-Rivers)

local awful = require("awful")

-- Since they're meant to be background processes, they're spawned with a shell
do 
    local background_processes = {
        -- Compositor
        "picom -b --experimental-backends &",
        -- Lockscreen from LightDM
        "light-locker &",
        -- Screenshot utility
        "flameshot &"
    }
    for _,i in pairs(background_processes) do
        awful.spawn.with_shell(i)
    end
end
