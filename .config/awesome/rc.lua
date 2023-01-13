-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

local beautiful = require("beautiful")

-- require("awful.hotkeys_popup.keys")



require("config.keymaps")
require("config.rules")
-- require("config.wibox")
require("config.layout")
require("config.screens")
require("config.error")
require("config.mouse")
require("config.signals")

-- beautiful.init(gears.filesystem.get_configuration_dir() .. "/themes/default/theme.lua")
-- local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), "default")
-- beautiful.init(theme_path)
beautiful.init("~/.config/awesome/themes/default/theme.lua")
