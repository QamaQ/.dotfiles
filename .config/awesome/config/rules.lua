local awful = require("awful")
local beautiful = require("beautiful")
-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = clientkeys,
      buttons = clientbuttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap + awful.placement.no_offscreen,
    },
  },

  -- Floating clients.
  {
    rule_any = {
      instance = {
        "DTA", -- Firefox addon DownThemAll.
        "copyq", -- Includes session name in class.
        "pinentry",
      },
      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "MessageWin", -- kalarm.
        "Sxiv",
        "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
        "Wpa_gui",
        "veromix",
        "xtightvncviewer",
      },

      -- Note that the name property shown in xprop might be set slightly after creation of the client
      -- and the name shown there might not match defined rules here.
      name = {
        "Event Tester", -- xev.
      },
      role = {
        "AlarmWindow", -- Thunderbird's calendar.
        "ConfigManager", -- Thunderbird's about:config.
        "pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
      },
    },
    properties = { floating = true, placement = awful.placement.centered },
  },

  -- Add titlebars to normal clients and dialogs
  { rule_any = { type = { "normal", "dialog" } }, properties = { titlebars_enabled = true } },

  -- Set Firefox to always map on the tag named "2" on screen 1.
  { rule = { class = "firefox" }, properties = { titlebars_enabled = false } },
  { rule = { class = "org.gnome.Nautilus" }, properties = { titlebars_enabled = false, floating = true } },

  { rule = { instance = "plugin-container" }, properties = { floating = true } },
  { rule = { instance = "exe" }, properties = { floating = true } },
  { rule = { class = "TelegramDesktop" }, properties = { floating = true } },
  { rule = { class = "Min" }, properties = { titlebars_enabled = false } },
  { rule = { class = "obsidian" }, properties = { titlebars_enabled = false } },
  { rule = { class = "xdg-desktop-portal-gnome" }, properties = { titlebars_enabled = false, floating = true } },
  { rule = { class = "mpv" }, properties = { floating = true } },
  { rule = { class = "Nemo" }, properties = { floating = true, titlebars_enabled = false } }
}
-- }}}
