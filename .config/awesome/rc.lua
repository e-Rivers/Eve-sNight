--  vim:fileencoding=utf-8:foldmethod=marker
--
--  ░█▀█░█░█░█▀▀░█▀▀░█▀█░█▄█░█▀▀░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀
--  ░█▀█░█▄█░█▀▀░▀▀█░█░█░█░█░█▀▀░░░█░░░█░█░█░█░█▀▀░░█░░█░█
--  ░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀
--
--  Author: Emilio Rivers (e-Rivers)

-- Imports awesomeWM requires libraries and utilities
local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
require("awful.autofocus")

-- Just an alias to the home path
local HOME = os.getenv('HOME')
-- Load theme
local current_theme = HOME .. '/.config/awesome/theme/theme.lua'
beautiful.init(current_theme)

-- Load the utilities (functionality)
-- It's important that layout is loaded before tag definition cause it uses the bling library components
require("utils.layout")
require('utils.autostart')
require('utils.rules')
require('utils.notification')
require('utils.keybind')
require('utils.error_handling')

-- Load the components (visuals and interactions)
require('components.tag')
require('components.dock')
require('components.volume_display')
require('components.brightness_display')


