local gears = require("gears")
local beautiful = require("beautiful")
local awful = require("awful")
local set_wallpaper = require("config.wallpaper")
local wibox = require("wibox")
-- local screen =require("screen")

local wibar = require("config.bar")

-- Themes define colours, icons, font and wallpapers.
-- beautiful.init(gears.filesystem.get_themes_dir() .. "default/theme.lua")

beautiful.init("~/.config/awesome/themes/default/theme.lua")
beautiful.useless_gap = 5


screen.connect_signal("property::geometry", set_wallpaper)
awful.screen.connect_for_each_screen(function(s)
  awful.tag({ "1", "2", "3", "4", "5", "6" }, s, awful.layout.layouts[1])

  -- Wallpaper
  set_wallpaper(s)

  wibar(s)
end)
