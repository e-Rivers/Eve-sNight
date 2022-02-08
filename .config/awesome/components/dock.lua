--   vim:fileencoding=utf-8:foldmethod=marker
--
--   AwesomeWM Dock definition file 
--   This setup is really simple, only shows the layout and taglist
--
--   Author: Emilio Rivers (e-Rivers)

local wibox  = require("wibox")
local awful = require("awful")
local icons = require("utils.icons")
local colors = require("theme.colorscheme")
local dashboard = require("components.dashboard")

-- Dock's width and height
local panel_size = { 650, 30 }

-- Creates a dock for each screen
screen.connect_signal("request::desktop_decoration", function (scr)

   scr.dock = awful.wibar{
      position = "top",
      height = panel_size[2],
      width = panel_size[1],
      screen = scr,
      visible = false,
      bg = {
        type = "linear",
        from = { 0, panel_size[2]/2  },
        to = { panel_size[1], panel_size[2]/2 },
        stops = { { 0, colors.transparent }, { 0.1, colors.col_4D }, { 0.2, colors.backOne }, { 0.8, colors.backOne }, { 0.9, colors.col_4D }, { 1, colors.transparent } }
      }
   }
   scr.mylayoutbox = awful.widget.layoutbox(scr)

   local function create_img_widget(image, action)
      local widget = wibox.widget {
         image = image,
         widget = wibox.widget.imagebox()
      }
      widget:buttons({
         awful.button({}, 1, function() awful.spawn(action) end)
      })
      return widget
   end

   -- Just a vertical line to visually separate sections of the dock
   local separator =  wibox.widget {
		orientation = "vertical",
		forced_height = 1,
		forced_width = 1,
        border_width = 5,
		span_ratio = 0.55,
		widget = wibox.widget.separator
	}
    -- Also a "separator" but transparent so it can be used as blankspace
    local blankspace =  wibox.widget {
		forced_height = 1,
		forced_width = 1,
        border_width = 5,
        color = "#00000000",
        visible = true,
		widget = wibox.widget.separator
	}

   local function create_widget_spawner(image, spawn)
      local widget = wibox.widget {
         image = image,
         widget = wibox.widget.imagebox()
      }
      widget:buttons({
         awful.button({}, 1, function()
            if spawn.visible == false then
                awesome.emit_signal("dashboard::update_info")
               spawn.visible = true
            else
               spawn.visible = false
            end
         end)
      })
      return widget
   end

    local dashboard_button = create_widget_spawner(icons.img.logo_dark, dashboard)
    
    local btn_tag = awful.button({}, 1, function(t) t:view_only() end)
    local taglist = awful.widget.taglist {                                            
    screen = scr,                                                                  
    buttons = btn_tag,                                                             
    filter = awful.widget.taglist.filter.all,                                      
    widget_template = {                                                            
            {                                                                          
                {                                                                      
                    {                                                                  
                        id = "icon_role",                                              
                        widget = wibox.widget.imagebox                                 
                    },                                                                 
                    left = 5,                                                          
                    right = 5,                                                         
                    widget = wibox.container.margin                                    
                },                                                                     
                id = "background_role",                                                
                widget = wibox.container.background                                    
            },                                                                         
            right = 0,                                                                 
            widget = wibox.container.margin                                            
        }                                                                              
    }

    -- This is the structure of the dock
    scr.dock : setup {
        {
            blankspace,
            blankspace,
            blankspace,
            blankspace,
            dashboard_button,
            separator,
            spacing = 15;
            layout = wibox.layout.fixed.horizontal,
        },
        {
            {
                taglist,
                spacing = 15,
                layout = wibox.layout.fixed.horizontal,
            },
            valign = "center",
            halign = "center",
            layout = wibox.container.place,
        },
        {
            separator,
            scr.mylayoutbox,
            blankspace,
            blankspace,
            blankspace,
            blankspace,
            spacing = 15,
            layout = wibox.layout.fixed.horizontal,
        },
        layout = wibox.layout.align.horizontal
    }
end)

