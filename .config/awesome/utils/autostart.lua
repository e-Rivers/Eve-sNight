local awful = require("awful")

-- Background processes that will execute automatically at startup
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
