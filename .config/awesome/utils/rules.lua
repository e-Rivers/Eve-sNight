--   vim:fileencoding=utf-8:foldmethod=marker
--
--   AwesomeWM window rules definition file 
--
--   Author: Emilio Rivers (e-Rivers)

local ruled = require('ruled')
local awful = require('awful')
local beautiful = require('beautiful')

awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { 
                     focus = awful.client.focus.filter,
                     raise = true,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen,
                     titlebars_enabled = false
     }
    },
    { rule_any = {
        instance = {
          "DTA",  -- Firefox addon DownThemAll.
          "copyq",  -- Includes session name in class.
          "pinentry",
        },
        class = {
            "xpad",
            "Pavucontrol",
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "MessageWin",  -- kalarm.
          "Sxiv",
          "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
          "Wpa_gui",
          "veromix",
          "xtightvncviewer"},

        -- Note that the name property shown in xprop might be set slightly after creation of the client
        -- and the name shown there might not match defined rules here.
        name = {
          "Event Tester",  -- xev.
        },
        role = {
          "AlarmWindow",  -- Thunderbird's calendar.
          "ConfigManager",  -- Thunderbird's about:config.
          "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
          "GtkFileChooserDialog",
          "conversation"
        },
        type = {
            "dialog"
        }
      }, properties = {
          floating = true,
          placement = awful.placement.centered
      }},

    -- Where to open certain applications
    { rule = { class = "Brave-browser" },
        properties = { tag = "3", switchtotag = true } },
    { rule = { class = "Popcorn-Time" },
        properties = { tag = "9", switchtotag = true } },
    { rule = { class = "Gimp-2.10" },
        properties = { tag = "5", switchtotag = true } },
    { rule = { class = "zoom" },
        properties = { tag = "0", switchtotag = true } }
}
