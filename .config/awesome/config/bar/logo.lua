local wibox = require("wibox")

local container_arch_widget = {
	{
		{
			text = "  ",
			font = "JetBrainsMono Nerd Font 12",
			widget = wibox.widget.textbox,
		},
		left   = 0,
		right  = 5,
		top    = 4,
		bottom = 4,
		widget = wibox.container.margin
	},
	fg     = "#fab387",
	widget = wibox.container.background
}

return container_arch_widget
