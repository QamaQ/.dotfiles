local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")

local taglist = require("config.bar.taglist")

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
      taglist(s),
    },
  })
end

return bar
