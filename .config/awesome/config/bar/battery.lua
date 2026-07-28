local wibox = require("wibox")
local awful = require("awful")
local gears =require("gears")

-- Batery widget
local container_battery_widget = wibox.container

local battery_widget = wibox.widget {
	align  = 'center',
	valign = 'center',
	widget = wibox.widget.textbox
}

local update_battery_widget = function(bat)
	battery_widget.text = "  " .. bat .. "%"
end

awful.widget.watch('sh -c "cat /sys/class/power_supply/BAT0/capacity"', 60, function(self, stdout)
	local bat = tonumber(stdout)
	update_battery_widget(bat)
end)

container_battery_widget = {
	{
		{
			{
				{
          font = "JetBrainsMono Nerd Font 9",
					widget = battery_widget,
				},
				left   = 2,
				right  = 2,
				top    = 0,
				bottom = 0,
				widget = wibox.container.margin
			},
			shape  = gears.shape.rounded_bar,
			fg     = "#a6e3a1",
			-- bg     = widget_bg,
			widget = wibox.container.background
		},

		left   = 5,
		right  = 5,
		top    = 7,
		bottom = 7,
		widget = wibox.container.margin
	},
	spacing = 5,
	layout  = wibox.layout.fixed.horizontal,
}

return container_battery_widget
