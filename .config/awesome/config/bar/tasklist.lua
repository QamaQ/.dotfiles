local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local colors = require("themes.default.theme")

local get_tasklist = function(s)
  local tasklist_buttons = gears.table.join(
    awful.button({}, 1, function(c)
      if c == client.focus then
        c.minimized = true
      else
        c:emit_signal("request::activate", "tasklist", { raise = true })
      end
    end),
    awful.button({}, 3, function()
      awful.menu.client_list({ theme = { width = 250 } })
    end),
    awful.button({}, 4, function()
      awful.client.focus.byidx(1)
    end),
    awful.button({}, 5, function()
      awful.client.focus.byidx(-1)
    end)
  )

  ----------------------------------------------------
  local tasklist = awful.widget.tasklist({
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    style = {
      shape = gears.shape.rounded_bar,
    },
    layout = {
      spacing = 10,
      layout = wibox.layout.fixed.horizontal,
    },
    -- Notice that there is *NO* wibox.wibox prefix, it is a template,
    -- not a widget instance.
    widget_template = {
      {
        {
          {
            {
              id = "text_role",
              widget = wibox.widget.textbox,
            },
            layout = wibox.layout.fixed.horizontal,
          },
          left = 10,
          right = 10,
          -- top = 5,
          -- bottom = 5,
          widget = wibox.container.margin,
        },
        fg = colors.fg_normal,
        bg = "#313131",
        shape = gears.shape.rounded_bar,
        widget = wibox.container.background,
      },
      left = 0,
      right = 0,
      top = 3,
      bottom = 2,
      widget = wibox.container.margin,
    },
  })

  return tasklist
end

return get_tasklist
