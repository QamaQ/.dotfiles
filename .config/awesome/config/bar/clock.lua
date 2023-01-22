local gears = require("gears")
local wibox = require("wibox")

-- local mytextclock = wibox.widget.textclock()
-- Clock widget
local container_clock_widget = {
	{
		{
			{
				{
          font = "JetBrainsMono Nerd Font 9",
					widget = wibox.widget.textclock()
				},
				left = 6,
				right = 6,
				top = 0,
				bottom = 0,
				widget = wibox.container.margin,
			},
			shape = gears.shape.rounded_bar,
			fg = "#b4befe",
			-- bg     = widget_bg,
			widget = wibox.container.background,
		},

		left = 5,
		right = 5,
		top = 7,
		bottom = 7,
		widget = wibox.container.margin,
	},
	spacing = 5,
	layout = wibox.layout.fixed.horizontal,
}

local container_arch_widget = {
	{
		{
			text = "  ",
			font = "JetBrainsMono Nerd Font 15",
			widget = wibox.widget.textbox,
		},
		left   = 0,
		right  = 5,
		top    = 2,
		bottom = 2,
		widget = wibox.container.margin
	},
	fg     = "#fab387",
	widget = wibox.container.background
}
return container_clock_widget
