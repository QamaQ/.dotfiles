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

