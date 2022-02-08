--   vim:fileencoding=utf-8:foldmethod=marker
--
--   AwesomeWM utility dashboard definition file 
--   This is the largest file around here, I'll probably be modifying it
--   so that each widget is on a separate file
--
--   Author: Emilio Rivers (e-Rivers)

local wibox = require("wibox")
local color = require("beautiful.xresources").get_current_theme()
local colors = require("theme.colorscheme")
local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local icons = require("utils.icons")
local apps = require("utils.apps")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

local HOME = os.getenv("HOME")

-- Basic necessary constants
local box_gap = 10
local col1_width = 250
local col2_width = 400
local col3_width = 175

-- Function to resize and set the wallpaper so it fits the entire screen
local image_file = gears.surface(HOME.."/.config/awesome/theme/wallpapers/wallpaper1-blur.jpg")
local img_width, img_height = gears.surface.get_size(image_file)
local function set_background_img(_, cr, width, height)
    cr:scale(width / img_width, height / img_height)
    cr:set_source_surface(image_file)
    cr:paint()
end

-- Dashboard's Definition
local dashboard = wibox {
   visible = false,
   ontop = true,
   type = "normal",

}
awful.placement.maximize(dashboard)

-- Function to toggle dashboard's visibility
local function dashboard_visibility()
   if dashboard.visible == true then
      dashboard.visible = false
   else
      dashboard.visible = true
   end
end

-- Function to resize and set the wallpaper of the widgets so it fits the size of their respective containers
local texture_img = gears.surface(HOME.."/.config/awesome/theme/wallpapers/widgets-texture.png")
local tex_width, tex_height = gears.surface.get_size(texture_img)
local function set_texture_img(_, cr, width, height)
    cr:scale(width / tex_width, height / tex_height)
    cr:set_source_surface(texture_img)
    cr:paint()
end

-- Function to create a widget container
local function widget_container(widget, width, height, bg, has_border)
   local container = wibox.container.background()
   if bg then
       container.bg = bg
   else
       container.bgimage = set_texture_img
   end
   container.shape_border_color = colors.col_4D
   if has_border then
        container.shape_border_width = 2
    else
        container.shape_border_width = 0
    end
   container.forced_height = height
   container.forced_width = width
   local box_widget = wibox.widget {
      {
         {
            nil,
            {
               nil,
               widget,
               layout = wibox.layout.align.vertical,
               expand = "none"
            },
            layout = wibox.layout.align.horizontal,
            expand = "none"
         },
         widget = container,
      },
      margins = box_gap,
      widget = wibox.container.margin
   }
   return box_widget
end

-- Clock Widget {{{

local clock_icon = wibox.widget {
    forced_width = 30,
    forced_height = 30,
    image = icons.img.clock,
    widget = wibox.widget.imagebox
}

local time = wibox.widget {
   {
      valign = "center",
      align = "center",
      font = "VictorMono Nerd Font 17.5",
      format = "<b>%H\n    %M</b>",
      widget = wibox.widget.textclock,
   },
   fg = colors.col_6L,
   widget = wibox.container.background
}

local clock = wibox.widget {
    wibox.container.margin(
        clock_icon, (col2_width/5)/2-27.5,0,5,5
    ),
    wibox.container.margin(
       time,-(col2_width/5)/2+15,0,0,0
   ),
   layout = wibox.layout.fixed.vertical
}

local clock_box = widget_container(clock, col2_width/5, 115, beautiful.bg_normal, true)

-- }}}

-- Weather Information {{{
-- This widget is an oversimplified version of the one made by streetturtle 
-- (https://github.com/streetturtle/awesome-wm-widgets/tree/master/weather-widget)

local json = require("libs.json")
local naughty = require("naughty")

local GET_FORECAST_CMD = [[bash -c "curl -s --show-error -X GET '%s'"]]

local function split_str(text)
    local array = {}
    for i in string.gmatch(text, "%S+") do
       table.insert(array, i)
    end
    return array
end

local function show_warning(message)
    naughty.notify {
        preset = naughty.config.presets.critical,
        title = "Weather Widget",
        text = message
    }
end

local weather_widget = {}
local warning_shown = false
local tooltip = awful.tooltip {
    mode = "outside",
    preferred_positions = {"bottom"}
}

--- Maps openWeatherMap icon name to file name w/o extension
local icon_map = {
    ["01d"] = "clear-sky",
    ["02d"] = "few-clouds",
    ["03d"] = "scattered-clouds",
    ["04d"] = "broken-clouds",
    ["09d"] = "shower-rain",
    ["10d"] = "rain",
    ["11d"] = "thunderstorm",
    ["13d"] = "snow",
    ["50d"] = "mist",
    ["01n"] = "clear-sky-night",
    ["02n"] = "few-clouds-night",
    ["03n"] = "scattered-clouds-night",
    ["04n"] = "broken-clouds-night",
    ["09n"] = "shower-rain-night",
    ["10n"] = "rain-night",
    ["11n"] = "thunderstorm-night",
    ["13n"] = "snow-night",
    ["50n"] = "mist-night"
}

--- Return wind direction as a string
local function to_direction(degrees)
    -- Ref: https://www.campbellsci.eu/blog/convert-wind-directions
    if degrees == nil then return "Unknown dir" end
    local directions = {
        "N", "NNE", "NE", "ENE", "E", "ESE", "SE", "SSE", "S", "SSW", "SW",
        "WSW", "W", "WNW", "NW", "NNW", "N"
    }
    return directions[math.floor((degrees % 360) / 22.5) + 1]
end

--- Convert degrees Celsius to Fahrenheit
local function celsius_to_fahrenheit(c) return c * 9 / 5 + 32 end

-- Convert degrees Fahrenheit to Celsius
local function fahrenheit_to_celsius(f) return (f - 32) * 5 / 9 end

local function gen_temperature_str(temp, fmt_str, show_other_units, units)
    local temp_str = string.format(fmt_str, temp)
    local s = temp_str .. "°" .. (units == "metric" and "C" or "F")

    if (show_other_units) then
        local temp_conv, units_conv
        if (units == "metric") then
            temp_conv = celsius_to_fahrenheit(temp)
            units_conv = "F"
        else
            temp_conv = fahrenheit_to_celsius(temp)
            units_conv = "C"
        end

        local temp_conv_str = string.format(fmt_str, temp_conv)
        s = s .. " " .. "(" .. temp_conv_str .. "°" .. units_conv .. ")"
    end
    return s
end

local function uvi_index_color(uvi)
    local color
    if uvi >= 0 and uvi < 3 then color = "#A3BE8C"
    elseif uvi >= 3 and uvi < 6 then color = "#EBCB8B"
    elseif uvi >= 6 and uvi < 8 then color = "#D08770"
    elseif uvi >= 8 and uvi < 11 then color = "#BF616A"
    elseif uvi >= 11 then color = "#B48EAD"
    end

    return '<span weight="bold" foreground="' .. color .. '">' .. uvi .. "</span>"
end

local args = user_args or {}

args.api_key="aa5eba1f08c1abeb181a6e7d1830bd97"
args.coordinates = {19.6469, -99.2467}
args.show_daily_forecast = true

--- Validate required parameters
if args.coordinates == nil or args.api_key == nil then
    show_warning("Required parameters are not set: " ..
                 (args.coordinates == nil and "<b>coordinates</b>" or "") ..
                 (args.api_key == nil and ", <b>api_key</b> " or ""))
    return
end

local coordinates = args.coordinates
local api_key = args.api_key
local font_name = args.font_name or beautiful.font:gsub("%s%d+$", "")
local units = args.units or "metric"
local time_format_12h = args.time_format_12h
local both_units_widget = args.both_units_widget or false
local show_daily_forecast = args.show_daily_forecast
local icon_pack_name = args.icons or "weather-icons"
local icons_extension = args.icons_extension or ".svg"
local timeout = args.timeout or 120

local ICONS_DIR = HOME.."/.config/awesome/theme/icons/" .. icon_pack_name .. "/"
local owm_one_cal_api =
    ("https://api.openweathermap.org/data/2.5/onecall" ..
        "?lat=" .. coordinates[1] .. "&lon=" .. coordinates[2] .. "&appid=" .. api_key ..
        "&units=" .. units .. "&exclude=minutely" ..
        (show_daily_forecast == false and ",daily" or ""))

weather_widget = wibox.widget {
    {
        {
            {
                {
                    id = "icon",
                    resize = true,
                    widget = wibox.widget.imagebox
                },
                valign = "center",
                widget = wibox.container.place,
            },
            {
                id = "txt",
                widget = wibox.widget.textbox
            },
            layout = wibox.layout.fixed.horizontal,
        },
        left = 4,
        right = 4,
        layout = wibox.container.margin
    },
    widget = wibox.container.background,
    set_image = function(self, path)
        self:get_children_by_id("icon")[1].image = path
    end,
    set_text = function(self, text)
        self:get_children_by_id("txt")[1].text = text
    end
}

local current_weather_widget = wibox.widget {
    {
        {
            {
                id = "icon",
                resize = true,
                forced_width = 128,
                forced_height = 128,
                widget = wibox.widget.imagebox
            },
            align = "center",
            widget = wibox.container.place
        },
        {
            id = "description",
            font = font_name .. " 10",
            align = "center",
            widget = wibox.widget.textbox
        },
        forced_width = 128,
        layout = wibox.layout.align.vertical
    },
    {
        {
            {
                id = "temp",
                font = font_name .. " 36",
                widget = wibox.widget.textbox
            },
            {
                id = "feels_like_temp",
                align = "center",
                font = font_name .. " 9",
                widget = wibox.widget.textbox
            },
            layout = wibox.layout.fixed.vertical
        },
        {
            {
                id = "wind",
                font = font_name .. " 9",
                widget = wibox.widget.textbox
            },
            {
                id = "humidity",
                font = font_name .. " 9",
                widget = wibox.widget.textbox
            },
            {
                id = "uv",
                font = font_name .. " 9",
                widget = wibox.widget.textbox
            },
            expand = "inside",
            layout = wibox.layout.align.vertical
        },
        spacing = 16,
        forced_width = 150,
        layout = wibox.layout.fixed.vertical
    },
    forced_width = 300,
    layout = wibox.layout.flex.horizontal,
    update = function(self, weather)
        self:get_children_by_id("icon")[1]:set_image(
            ICONS_DIR .. icon_map[weather.weather[1].icon] .. icons_extension)
        self:get_children_by_id("temp")[1]:set_text(gen_temperature_str(weather.temp, "%.0f", false, units))
        self:get_children_by_id("feels_like_temp")[1]:set_text(
            "Feels like " .. gen_temperature_str(weather.feels_like, "%.0f", false, units))
        self:get_children_by_id("description")[1]:set_text(weather.weather[1].description)
        self:get_children_by_id("wind")[1]:set_markup(
            "Wind: " .. "<b>" .. weather.wind_speed .. "m/s (" .. to_direction(weather.wind_deg) .. ")</b>")
        self:get_children_by_id("humidity")[1]:set_markup("Humidity: " .. "<b>" .. weather.humidity .. "%</b>")
        self:get_children_by_id("uv")[1]:set_markup("UV: " .. uvi_index_color(weather.uvi))
    end
}

local daily_forecast_widget = {
    forced_width = 300,
    layout = wibox.layout.flex.horizontal,
    update = function(self, forecast, timezone_offset)
        local count = #self
        for i = 0, count do self[i]=nil end
        for i, day in ipairs(forecast) do
            if i > 5 then break end
            local day_forecast = wibox.widget {
                {
                    text = os.date("%a", tonumber(day.dt) + tonumber(timezone_offset)),
                    align = "center",
                    font = font_name .. " 9",
                    widget = wibox.widget.textbox
                },
                {
                    {
                        {
                            image = ICONS_DIR .. icon_map[day.weather[1].icon] .. icons_extension,
                            resize = true,
                            forced_width = 48,
                            forced_height = 48,
                            widget = wibox.widget.imagebox
                        },
                        align = "center",
                        layout = wibox.container.place
                    },
                    {
                        text = table.concat(split_str(day.weather[1].description), "\n"),
                        font = font_name .. " 8",
                        align = "center",
                        forced_height = 50,
                        widget = wibox.widget.textbox
                    },
                    layout = wibox.layout.fixed.vertical
                },
                {
                    {
                        text = gen_temperature_str(day.temp.day, "%.0f", false, units),
                        align = "center",
                        font = font_name .. " 9",
                        widget = wibox.widget.textbox
                    },
                    {
                        text = gen_temperature_str(day.temp.night, "%.0f", false, units),
                        align = "center",
                        font = font_name .. " 9",
                        widget = wibox.widget.textbox
                    },
                    layout = wibox.layout.fixed.vertical
                },
                spacing = 8,
                layout = wibox.layout.fixed.vertical
            }
            table.insert(self, day_forecast)
        end
    end
}

function update_widget(widget, stdout, stderr)
    if stderr ~= "" then
        if not warning_shown then
            if (stderr ~= "curl: (52) Empty reply from server"
            and stderr ~= "curl: (28) Failed to connect to api.openweathermap.org port 443: Connection timed out"
            and stderr:find("^curl: %(18%) transfer closed with %d+ bytes remaining to read$") ~= nil
            ) then
                show_warning(stderr)
            end
            warning_shown = true
            tooltip:add_to_object(widget)

            widget:connect_signal("mouse::enter", function() tooltip.text = stderr end)
        end
        return
    end

    warning_shown = false
    tooltip:remove_from_object(widget)

    local result = json.decode(stdout)

    current_weather_widget:update(result.current)

    local final_widget = {
        current_weather_widget,
        spacing = 16,
        layout = wibox.layout.fixed.vertical
    }

    if show_daily_forecast then
        daily_forecast_widget:update(result.daily, result.timezone_offset)
        table.insert(final_widget, daily_forecast_widget)
    end

    weather_widget:setup({
        {
            final_widget,
            margins = 10,
            widget = wibox.container.margin
        },
        bg = beautiful.bg_normal,
        widget = wibox.container.background
    })
end

local update_weather = function()
    awful.spawn.easy_async_with_shell(string.format(GET_FORECAST_CMD, owm_one_cal_api), function(out)
        update_widget(weather_widget, out, "")
    end)
end

local weather_info = wibox.widget {
    weather_widget,
   spacing = 15,
   layout = wibox.layout.fixed.horizontal
}

local weather = widget_container(weather_info, (col2_width/5)*4, 370, beautiful.bg_normal, true)

-- }}}

-- System Information Bars {{{

-- Battery Bar {{{

local battery_icon = wibox.widget {
    forced_width = 20,
    forced_height = 20,
    image = icons.img.info_battery,
    widget = wibox.widget.imagebox
}

local battery_bar = wibox.widget {
      max_value     = 100,
      forced_height = 25,
      forced_width  = (((col2_width/4)*3)/4)*3,
      border_width  = 0,
      margins       = {
         top = 8,
         bottom = 8,
      },
      background_color = colors.col_1D,
      color = colors.col_4D,
      border_color = color.background,
      widget        = wibox.widget.progressbar,
}

local get_battery = function()
    awful.spawn.easy_async_with_shell("upower -i `upower -e | grep 'BAT'` | grep percentage | awk '{print $2}' | tr -d '%'", function(out)
        battery_bar.value = tonumber(out)
    end)
end

local battery = wibox.widget {
   nil,
   {
       battery_bar,
       wibox.container.margin(
        battery_icon,10,0,0,0
      ),
      layout = wibox.layout.fixed.horizontal
   },
   expand = "none",
   layout = wibox.layout.align.horizontal
}

-- }}}

-- Volume Bar {{{

local volume_icon = wibox.widget {
    forced_width = 20,
    forced_height = 20,
    image = icons.img.info_volume,
    widget = wibox.widget.imagebox
}

local volume_bar = wibox.widget {
      max_value     = 100,
      forced_height = 25,
      forced_width  = (((col2_width/4)*3)/4)*3,
      border_width  = 0,
      margins       = {
         top = 8,
         bottom = 8,
      },
      background_color = colors.col_1D,
      color = colors.col_5D,
      border_color = color.background,
      widget        = wibox.widget.progressbar,
}

local get_volume = function()
    awful.spawn.easy_async_with_shell(
       "sleep 0.1 && ([ $(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}') = 'no' ] && (pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//') || echo MUTED)", function(out) 
          if (tonumber(out) ~= nil) then
              volume_bar.value = tonumber(out)
          else
             volume_bar.value = 0
          end
    end)
end

local volume = wibox.widget {
   nil,
   {
       volume_bar,
       wibox.container.margin(
        volume_icon,10,0,2.5,0
      ),
      layout = wibox.layout.fixed.horizontal
   },
   expand = "none",
   layout = wibox.layout.align.horizontal
}

-- }}}

-- Storage Bar {{{

local storage_icon = wibox.widget {
    forced_width = 20,
    forced_height = 20,
    image = icons.img.info_storage,
    widget = wibox.widget.imagebox
}

local storage_bar = wibox.widget {
      max_value     = 100,
      forced_height = 25,
      forced_width  = (((col2_width/4)*3)/4)*3,
      border_width  = 0,
      margins       = {
         top = 8,
         bottom = 8,
      },
      background_color = colors.col_1D,
      color = colors.col_2D,
      border_color = color.background,
      widget        = wibox.widget.progressbar,
}

local get_storage = function()
    awful.spawn.easy_async_with_shell("df --total --output=source,pcent | grep total | awk '{print $2}' | tr -d '%'", function(out)
        storage_bar.value = tonumber(out)
    end)
end

local storage = wibox.widget {
   nil,
   {
       wibox.container.margin(
          storage_icon, 0,10,0,0
      ),
      storage_bar,
      layout = wibox.layout.fixed.horizontal
   },
   expand = "none",
   layout = wibox.layout.align.horizontal
}

-- }}}

-- Brightness Bar {{{

local brightness_icon = wibox.widget {
    forced_width = 20,
    forced_height = 20,
    image = icons.img.info_brightness,
    widget = wibox.widget.imagebox
}

local brightness_bar = wibox.widget {
      -- IMPORTANT!!!!!!!!!!
      -- This was the corresponding max brightness value for my system, yours may be different so check that
      -- if you notice a wrong behaviour
      max_value     = 976,
      forced_height = 25,
      forced_width  = (((col2_width/4)*3)/4)*3,
      border_width  = 0,
      margins       = {
         top = 8,
         bottom = 8,
      },
      background_color = colors.col_1D,
      color = colors.col_3D,
      border_color = color.background,
      widget        = wibox.widget.progressbar,
}

local get_brightness = function()
    awful.spawn.easy_async_with_shell("sleep 0.1 && brightnessctl get", function(out)
        brightness_bar.value = tonumber(out)
    end)
end

local brightness = wibox.widget {
   nil,
   {
       wibox.container.margin(
          brightness_icon, 0,10,2.5,0
      ),
      brightness_bar,
      layout = wibox.layout.fixed.horizontal
   },
   expand = "none",
   layout = wibox.layout.align.horizontal
}

-- }}}

local middle_top_box = wibox.widget {
   nil,
   {
      {
         storage,
         battery,
         brightness,
         volume,
         spacing = 1,
         layout = wibox.layout.fixed.vertical
      },
      margins = box_gap,
      layout = wibox.container.margin
   },
   nil,
   expand = "none",
   layout = wibox.layout.align.vertical
}
local progress_box = widget_container(middle_top_box, 3*(col2_width/4), 125, beautiful.bg_normal, true)

-- }}}

-- Calendar widget {{{

local styles = {}
styles.month   = { padding      = 20,
   fg_color     = color.foreground,
   bg_color     = color.background.."00",
   border_width = 0,
}
styles.normal  = {}
styles.focus   = {
    fg_color = colors.col_1X,
   bg_color = colors.transparent,
   markup   = function(t) return "<b>" .. t .. "</b>" end,
}
styles.header  = { 
    fg_color = colors.col_5D,
   bg_color = color.color1.."00",
   -- markup   = function(t) return "<b>" .. t .. "</b>" end,
   markup   = function(t) return '<span font_desc="VictorMono Nerd Font 20"><b><i>' .. t .. "</i></b></span>" end,
}
styles.weekday = { 
    fg_color = colors.col_2L,
   bg_color = color.color1.."00",
   padding  = 3,
   markup   = function(t) return "<b>" .. t .. "</b>" end,
}
local function decorate_cell(widget, flag, date)
   if flag=="monthheader" and not styles.monthheader then
      flag = "header"
   end
   local props = styles[flag] or {}
   if props.markup and widget.get_text and widget.set_markup then
      widget:set_markup(props.markup(widget:get_text()))
   end
   -- Change bg color for weekends
   local d = {year=date.year, month=(date.month or 1), day=(date.day or 1)}
   local weekday = tonumber(os.date("%w", os.time(d)))
   local default_fg = colors.white
   local default_bg = colors.transparent
   local ret = wibox.widget {
      {
         widget,
         margins = (props.padding or 2) + (props.border_width or 0),
         widget  = wibox.container.margin
      },
      shape              = props.shape,
      shape_border_color = props.border_color or color.background,
      shape_border_width = props.border_width or 0,
      fg                 = props.fg_color or default_fg,
      bg                 = props.bg_color or default_bg,
      widget             = wibox.container.background
   }
   return ret
end


local calendar_widget = wibox.widget {
   font     = "VictorMono Nerd Font 10",
   long_weekdays = false,
   spacing  = 3,
   fn_embed = decorate_cell,
   widget   = wibox.widget.calendar.month
}

local calendar = widget_container(calendar_widget, col1_width, 375, beautiful.bg_normal, true)

-- }}}

-- Upgrades Available {{{

local upgrade_info = wibox.widget {
    font = "VictorMono Nerd Font 10",
    text = "Getting upgrades",
    align = "center",
    widget = wibox.widget.textbox
}

local upgrade_icon = wibox.widget {
    forced_width = 50,
    forced_height = 50,
    image = icons.img.upgrade,
    widget = wibox.widget.imagebox
}

local get_upgrades = function()
    awful.spawn.easy_async_with_shell("paru -Qu | wc -l", function(out)
        upgrade_info.markup = "<b><span foreground='"..colors.col_3D.."'>"..out.."upgrades</span></b>"
    end)
end

local upgrade_widget = wibox.widget {
    {
        upgrade_info,
        wibox.container.margin(
            upgrade_icon, 0,0,7.5,0
        ),
        layout = wibox.layout.align.vertical,
    },
    margins = box_gap * 0.5,
    widget = wibox.container.margin
}

local upgrades = widget_container(upgrade_widget, col2_width/4, 125, { type="png", file=texture_img }, true)

upgrades:buttons(gears.table.join(
   awful.button({ }, 1, function ()
      awful.spawn.easy_async_with_shell("paru -Qu > "..HOME.."/.upgrades", function(out)
        awful.spawn(apps.terminal.." bat -nf --theme=base16 --paging=always "..HOME.."/.upgrades")
        awful.spawn.easy_async_with_shell("sleep 1; rm "..HOME.."/.upgrades", function(out)
        end)
      end)
      dashboard_visibility()
   end)
))

-- }}}

-- Eve'sNight Logo {{{

local logo = wibox.widget {
    forced_width = 150,
    forced_height = 150,
    image = icons.img.logo,
    widget = wibox.widget.imagebox
}

local logo_box = widget_container(logo, col3_width, 175, { type="png", file=texture_img }, true)

logo_box:buttons(gears.table.join(
   awful.button({ }, 1, function ()
      dashboard_visibility()
   end)
))

-- }}}

-- Exit Actions {{{

local exit_icon = wibox.widget {
    forced_width = 20,
    forced_height = 20,
    image = icons.img.exit,
    widget = wibox.widget.imagebox
}

local exit_actions = widget_container(exit_icon, col3_width/3, 60, nil, true)

exit_actions:buttons(gears.table.join(
   awful.button({ }, 1, function ()
       awful.spawn.with_shell(HOME.."/.config/rofi/scripts/powermenu.sh")
      dashboard_visibility()
   end)
))

-- }}}

-- Uptime Information {{{

local uptime_info = wibox.widget {
    font = "VictorMono Nerd Font 10",
    text = "Getting uptime info...",
    widget = wibox.widget.textbox
}

local get_uptime = function()
    awful.spawn.easy_async_with_shell("uptime -p | awk '{ s = \"\"; for (i = 2; i <= NF; i++) s = s $i \" \"; print s }'", function(out)
        -- Remove trailing whitespaces
        out = out:gsub("^%s*(.-)%s*$", "%1")
        uptime_info.markup = "This system has been active for:\n<b>"..out.."</b>"
    end)
end

local uptime_logo = wibox.widget {
    forced_width = 50,
    forced_height = 50,
    image = icons.img.uptime,
    widget = wibox.widget.imagebox
}

local uptime_widget = wibox.widget {
    {
        wibox.container.margin(
            uptime_logo, 0, 30, 0, 0
        ),
        uptime_info,
        layout = wibox.layout.align.horizontal,
    },
    margins = box_gap * 1,
    widget = wibox.container.margin
}

local uptime = widget_container(uptime_widget, col2_width, 75, beautiful.bg_normal, true)

-- }}}

-- Internet Connection {{{

local wifi_conn = wibox.widget {
    font = "VictorMono Nerd Font 9",
    text = "Retrieving Wifi\nInformation...",
    align = "center",
    widget = wibox.widget.textbox
}

local wifi_logo = wibox.widget {
    forced_width = 50,
    forced_height = 50,
    widget = wibox.widget.imagebox
}

local get_wifi_conn = function()
    -- Get wifi's SSID
    awful.spawn.easy_async_with_shell("nmcli --fields IN-USE,SSID device wifi list | grep \\* | awk '{ s = \"\"; for (i = 2; i <= NF; i++) s = s $i \" \"; print s }' | awk -v len=18 '{if (length($0) > len) print substr($0, 1, len-3) \"...\"; else print; }'", function(out)
        -- Remove trailing whitespaces
        out = out:gsub("^%s*(.-)%s*$", "%1")
        if out == "" then
            wifi_conn.markup = "There's NO active\nwifi connection..."
        else
            wifi_conn.markup = "Connected to:\n<b>"..out.."</b>"
        end
    end)
    -- Get wifi signal strenght
    awful.spawn.easy_async_with_shell("nmcli dev wifi list | awk '/\\*/{if (NR!=1) {print $8}}'", function(out)
        -- Remove trailing whitespaces
        out = out:gsub("^%s*(.-)%s*$", "%1")
        if out == "" then
            wifi_logo.image = icons.img.wifi_null 
        else
            if tonumber(out) > 75 then
                wifi_logo.image = icons.img.wifi_high
            elseif tonumber(out) > 50 then
                wifi_logo.image = icons.img.wifi_norm
            elseif tonumber(out) > 25 then
                wifi_logo.image = icons.img.wifi_midd
            else
                wifi_logo.image = icons.img.wifi_lows
            end
        end
    end)
end

local wifi_widget = wibox.widget {
    {
        wibox.container.margin(
            wifi_logo, 0, 15, 10, 10
        ),
        wifi_conn,
        layout = wibox.layout.align.horizontal,
    },
    margins = 10,
    widget = wibox.container.margin
}

local wifi_internet = widget_container(wifi_widget, 7*(col1_width/8), 100, beautiful.bg_normal, true)

-- }}}

-- Fortune Cookie {{{

local fortune = wibox.widget {
    font = "VictorMono Nerd Font 9",
    text = "Loading your cookie...",
    widget = wibox.widget.textbox
}

local update_fortune = function()
    awful.spawn.easy_async_with_shell("fortune -n 140 -s "..HOME.."/.config/misc/bible-fortune/bible",
    function(out)
        local array = {}
        for i in string.gmatch(out, "[^\r\n]+") do
           table.insert(array, i)
        end
        local verse = array[#array]
        table.remove(array, #array)
        local quote = table.concat(array, " ")
        fortune.markup = "<i>"..quote.."\n<b><span foreground='"..colors.col_4L.."'>"..verse.."</span></b></i>"
    end)
end

local fortune_widget = wibox.widget {
    {
        fortune,
        layout = wibox.layout.align.horizontal,
    },
    margins = box_gap * 1.5,
    widget = wibox.container.margin
}

local fortune_box = widget_container(fortune_widget, col2_width, 100, beautiful.bg_normal, true)

-- }}}

-- Pomodoro Timer {{{

local pomo_icon = wibox.widget {
    forced_width = 30,
    forced_height = 30,
    image = icons.img.pomodoro,
    widget = wibox.widget.imagebox
}

local pomodoro = widget_container(pomo_icon, col2_width/5, 44, nil, true)

pomodoro:buttons(gears.table.join(
   awful.button({ }, 1, function ()
       awful.spawn(apps.agenda)
       dashboard_visibility()
   end)
))

-- }}}

-- News Direct Access {{{

local news_icon = wibox.widget {
    forced_width = 30,
    forced_height = 30,
    image = icons.img.news,
    widget = wibox.widget.imagebox
}

local news = widget_container(news_icon, col2_width/5, 44, nil, true)

news:buttons(gears.table.join(
   awful.button({ }, 1, function ()
       awful.spawn(apps.brave.." https://edition.cnn.com/")
       dashboard_visibility()
   end)
))

-- }}}

-- Night Mode Toggle {{{

local night_icon = wibox.widget {
    forced_width = 30,
    forced_height = 30,
    image = icons.img.night_mode,
    widget = wibox.widget.imagebox
}

local night_mode = widget_container(night_icon, col2_width/5, 44, nil, true)

night_mode:buttons(gears.table.join(
   awful.button({ }, 1, function ()
       awful.spawn.easy_async_with_shell("pgrep redshift", function(out)
           if out ~= "" then
               awful.spawn.with_shell("redshift -x && pkill redshift && killall -9 redshift")
           else
               awful.spawn.with_shell("redshift -l 0:0 -t 2500:2500 -r &>/dev/null &")
           end
       end)
   end)
))

-- }}}

-- Keybindings Popup Help {{{

local help_icon = wibox.widget {
    forced_width = 30,
    forced_height = 30,
    image = icons.img.help,
    widget = wibox.widget.imagebox
}

local help = widget_container(help_icon, col2_width/5, 44, nil, true)

help:buttons(gears.table.join(
   awful.button({ }, 1, function ()
       dashboard_visibility()
       hotkeys_popup.show_help()
   end)
))

-- }}}

-- User Information {{{

local user_details = wibox.widget {
    font = "VictorMono Nerd Font 10",
    text = "Getting user info",
    align = "center",
    widget = wibox.widget.textbox
}

local profile_picture = wibox.widget {
    forced_width = 110,
    forced_height = 110,
    widget = wibox.widget.imagebox
}

local get_user_info = function()
    local realname = ""
    local username = ""
    local hostname = ""
    awful.spawn.easy_async_with_shell("getent passwd $(whoami) | cut -d: -f5 | awk -v len=20 '{if (length($0) > len) print substr($0, 1, len-3) \"...\"; else print; }'", function(out)
        realname = out
        awful.spawn.easy_async_with_shell("whoami | awk -v len=20 '{if (length($0) > len) print substr($0, 1, len-3) \"...\"; else print; }'", function(out)
            username = out
            awful.spawn.easy_async_with_shell("hostnamectl | grep hostname | awk '{print $3}' | awk -v len=20 '{if (length($0) > len) print substr($0, 1, len-3) \"...\"; else print; }'", function(out)
                hostname = out
                user_details.markup = "<b><span foreground='"..colors.white.."'>"..realname.."</span><span foreground='"..colors.col_5X.."'>"..username.."</span><span foreground='"..colors.col_2D.."'><i>@"..hostname.."</i></span></b>"
            end)
        end)
    end)
    -- Get profile picture
    awful.spawn.easy_async_with_shell("[[ -f "..HOME.."/.config/awesome/theme/pictures/$(whoami).png ]] && echo EXISTS", function(out)
        if out ~= "" then
            profile_picture.image = HOME.."/.config/awesome/theme/pictures/"..os.getenv("USER")..".png"
        else
            profile_picture.image = HOME.."/.config/awesome/theme/pictures/default-profile-picture.png"
        end
    end)
end

local user_info = wibox.widget {
    {
        wibox.container.margin(
            profile_picture, 0,0,15,15
        ),
        user_details,
        layout = wibox.layout.align.vertical,
    },
    margins = box_gap * 0.5,
    widget = wibox.container.margin
}

local user = widget_container(user_info, col3_width, 225, beautiful.bg_normal, true)

-- }}}

awesome.connect_signal("dashboard::update_info",
    function()
        -- COMMENT THE NEXT THREE LINES IF YOU'RE ONLY USING ONE WALLPAPER ON ALL TAGS 
        image_file = gears.surface(HOME.."/.config/awesome/theme/wallpapers/wallpaper"..awful.tag.selected(1).name.."-blur.jpg")
        img_width, img_height = gears.surface.get_size(image_file)
        dashboard.bgimage = set_background_img
        --
        update_weather()
        calendar_widget.date = os.date("*t")
        update_fortune()
        get_wifi_conn()
        get_user_info()
        get_uptime()
        get_upgrades()
        get_storage()
        get_battery()
        get_brightness()
        get_volume()
    end)

awesome.connect_signal("dashboard::update_info::brightness",
    function()
        get_brightness()
    end)

awesome.connect_signal("dashboard::update_info::volume",
    function()
        get_volume()
    end)

-- This is the dashboard's structure
dashboard:setup {
   nil,
   {
      nil,
      {
          -- FIRST COLUMN
         {
            nil,
            widget_container(nil, col1_width, 60, colors.transparent, false),
            calendar,
            widget_container(nil, col1_width, 100, colors.transparent, false),
            {
                widget_container(nil, col1_width/8, 100, colors.transparent, false),
                wifi_internet,
                layout = wibox.layout.fixed.horizontal
            },
            layout = wibox.layout.fixed.vertical
         },
         -- SECOND COLUMN
         {
             uptime,
             {
                 {
                     pomodoro,
                     news,
                     night_mode,
                     help,
                    clock_box,
                    layout = wibox.layout.fixed.vertical
                },
                weather,
                layout = wibox.layout.fixed.horizontal
            },
            {
                progress_box,
                upgrades,
                layout = wibox.layout.fixed.horizontal
            },
            fortune_box,
            layout = wibox.layout.fixed.vertical
         },
         -- THIRD COLUMN
         {
            widget_container(nil, col3_width, 10, colors.transparent, false),
            logo_box,
            widget_container(nil, col3_width, 100, colors.transparent, false),
            user,
            {
                widget_container(nil, (col3_width/3)*2, 10, colors.transparent, false),
                exit_actions,
                layout = wibox.layout.fixed.horizontal
            },
            layout = wibox.layout.fixed.vertical
         },
         layout = wibox.layout.fixed.horizontal
      },
      nil,
      expand = "none",
      layout = wibox.layout.align.horizontal
   },
   expand = "none",
   layout = wibox.layout.align.vertical

}

return dashboard
