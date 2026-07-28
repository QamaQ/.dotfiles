local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")

local arch_logo = require("config.bar.logo")
local taglist = require("config.bar.taglist")
local tasklist = require("config.bar.tasklist")
local battery = require("config.bar.battery")
local clock = require("config.bar.clock")
local brightness = require("config.bar.brightness")
local systray = require("config.bar.systray")

local bar = function(s)
	local wb = awful.wibar({
		position = "top",
		screen = s,
		bg = beautiful.background,
	})
	wb:setup({
		layout = wibox.layout.align.horizontal,
		{
			layout = wibox.layout.align.horizontal,
			arch_logo,
			taglist(s),
		},
		{
			{
				tasklist(s),
				layout = wibox.layout.align.horizontal,
			},
			halign = "center",
			layout = wibox.container.place,
		},
		{
			layout = wibox.layout.fixed.horizontal,
			battery,
			-- container_battery_widget
			clock,
			systray,
		},
	})
end

return bar
