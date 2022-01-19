local wibox  = require('wibox')
local awful = require('awful')
local icon = require('utils.icon')
local apps = require('utils.apps')
local colors = require("theme.colorscheme")
local color = require("beautiful.xresources").get_current_theme()
local dashboard = require('components.dashboard')

local panel_size = { 650, 30}

awful.screen.connect_for_each_screen(function (scr)

   scr.dock = awful.wibar{
      position = "top",
      height = panel_size[2],
      width = panel_size[1],
      screen = scr,
      visible = true,
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

   local separator =  wibox.widget {
		orientation = 'vertical',
		forced_height = 1,
		forced_width = 1,
        border_width = 5,
		span_ratio = 0.55,
		widget = wibox.widget.separator
	}
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
               spawn.visible = true
            else
               spawn.visible = false
            end
         end)
      })
      return widget
   end

   local dashboard_button = create_widget_spawner(icon.png.launcher, dashboard)

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
         valign = 'center',
         halign = 'center',
         layout = wibox.container.place,
      },
      {
        separator,
        scr.mylayoutbox,
                    blankspace,
                    blankspace,
                    blankspace,
                    blankspace,
      spacing = 15;
         layout = wibox.layout.fixed.horizontal,
      },
      layout = wibox.layout.align.horizontal
   }
end)

-- set auto hide dock when window not on floating mode
-- client.connect_signal("property::floating", function(c)
--    if c.floating then
--       dock.container.visible = true
--    else
--       dock.container.visible = false
--    end
-- end)
-- client.connect_signal("manage", function(c)
--    if c.floating or c.first_tag.layout.name == "floating" then
--       dock.container.visible = true
--    else
--       dock.container.visible = true
--    end
-- end)

-- tag.connect_signal("properties::layout", function(c)
--    local clients = c.clients()
--    for k,v in pairs(clients) do
--       if v.floating or v.first_tag.layout.name == "floating" then
--          dock.container.visible = true
--       else
--          dock.container.visible = false
--       end
--    end
-- end)
--

