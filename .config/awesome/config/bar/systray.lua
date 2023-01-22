local wibox = require("wibox")
local gears =require("gears")
local systray_widget = {
	{
		{
			{
				{
          -- font = "JetBrainsMono Nerd Font 9",
					widget = wibox.widget.systray()
				},
				widget = wibox.container.margin,
			},
			shape = gears.shape.rounded_bar,
			fg = "#b4befe",
			-- bg     = widget_bg,
			widget = wibox.container.background,
		},

		left = 5,
		right = 5,
		top = 5,
		bottom = 5,
		widget = wibox.container.margin,
	},
	spacing = 5,
	layout = wibox.layout.fixed.horizontal,
}

return systray_widget
