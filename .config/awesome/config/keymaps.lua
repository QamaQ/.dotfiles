local awful = require("awful")
local gears = require("gears")
local brightness_widget = require("config.bar.brightness")

require("awful.hotkeys_popup.keys")

local terminal = "kitty"
modkey = "Mod4"
modAlt = "Mod1"

-- {{{ Key bindings
globalkeys = gears.table.join(

-- Standard program
  awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
  awful.key({ modkey, "Control" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

  awful.key({ modkey }, "Return", function()
    awful.spawn(terminal)
  end, { description = "open a terminal", group = "launcher" }),

  awful.key({ modkey }, "m", function()
    awful.spawn("rofi -show drun")
  end, { description = "Open rofi louncher", group = "louncher" }),

  awful.key({ modAlt }, "Tab", function()
    awful.spawn("rofi -show window")
  end, { description = "Open rofi windows", group = "louncher" }),

  -- layouts
  awful.key({ modkey }, "j", function()
    awful.client.focus.byidx(1)
  end, { description = "focus next by index", group = "client" }),
  awful.key({ modkey }, "k", function()
    awful.client.focus.byidx(-1)
  end, { description = "focus previous by index", group = "client" }),
  awful.key({ modkey }, "Left", function()
    awful.client.focus.byidx(1)
  end, { description = "focus next by index", group = "client" }),
  awful.key({ modkey }, "Right", function()
    awful.client.focus.byidx(-1)
  end, { description = "focus previous by index", group = "client" }),

  -- Layout manipulation
  awful.key({ modkey, "Shift" }, "j", function()
    awful.client.swap.byidx(1)
  end, { description = "swap with next client by index", group = "client" }),
  awful.key({ modkey, "Shift" }, "k", function()
    awful.client.swap.byidx(-1)
  end, { description = "swap with previous client by index", group = "client" }),

  -- next scree
  awful.key({ modkey }, "comma", function()
    awful.screen.focus_relative(1)
  end, { description = "focus the next screen", group = "screen" }),
  awful.key({ modkey }, "period", function()
    awful.screen.focus_relative(-1)
  end, { description = "focus the previous screen", group = "screen" }),
  awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),

  -- Volume Keys
  awful.key({}, "XF86AudioLowerVolume", function()
    awful.util.spawn("amixer -q -D pulse sset Master 5%-", false)
  end),
  awful.key({}, "XF86AudioRaiseVolume", function()
    awful.util.spawn("amixer -q -D pulse sset Master 5%+", false)
  end),
  awful.key({}, "XF86AudioMute", function()
    awful.util.spawn("amixer -D pulse set Master 1+ toggle", false)
  end),
  -- Media Keys
  awful.key({}, "XF86AudioPlay", function()
    awful.util.spawn("playerctl play-pause", false)
  end),
  awful.key({}, "XF86AudioNext", function()
    awful.util.spawn("playerctl next", false)
  end),
  awful.key({}, "XF86AudioPrev", function()
    awful.util.spawn("playerctl previous", false)
  end),

  -- Brightness
  awful.key({}, "XF86MonBrightnessUp", function()
    awful.spawn("brightnessctl s +10%")
  end, { description = "+10% brightness", group = "hotkeys" }),
  awful.key({}, "XF86MonBrightnessDown", function()
    awful.spawn("brightnessctl s 10%-")
  end, { description = "-10% brightness", group = "hotkeys" }),
  awful.key(
    { modkey },
    "XF86MonBrightnessDown", -- Very low for night
    function()
      awful.spawn("brightnessctl s 5%")
    end,
    { description = "5% brightness", group = "hotkeys" }
  ),

  -- screenshots
  awful.key({}, "Print", function ()
    awful.spawn("flameshot gui")
  end)
)

for i = 1, 9 do
  globalkeys = gears.table.join(
    globalkeys,
    -- View tag only.
    awful.key({ modkey }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        tag:view_only()
      end
    end, { description = "view tag #" .. i, group = "tag" }),
    -- Toggle tag display.
    awful.key({ modkey, "Control" }, "#" .. i + 9, function()
      local screen = awful.screen.focused()
      local tag = screen.tags[i]
      if tag then
        awful.tag.viewtoggle(tag)
      end
    end, { description = "toggle tag #" .. i, group = "tag" }),
    -- Move client to tag.
    awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:move_to_tag(tag)
        end
      end
    end, { description = "move focused client to tag #" .. i, group = "tag" }),
    -- Toggle tag on focused client.
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
      if client.focus then
        local tag = client.focus.screen.tags[i]
        if tag then
          client.focus:toggle_tag(tag)
        end
      end
    end, { description = "toggle focused client on tag #" .. i, group = "tag" })
  )
end

clientkeys = gears.table.join(
  awful.key({ modkey }, "f", awful.client.floating.toggle, { description = "toggle floating", group = { "client" } }),

  awful.key({ modkey, "Control" }, "w", function(c)
    c:kill()
  end, { description = "close", group = "client" })
)

clientbuttons = gears.table.join(
  awful.button({}, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
  end),
  awful.button({ modkey }, 1, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.move(c)
  end),
  awful.button({ modkey }, 3, function(c)
    c:emit_signal("request::activate", "mouse_click", { raise = true })
    awful.mouse.client.resize(c)
  end)
)
-- Set keys
root.keys(globalkeys)
