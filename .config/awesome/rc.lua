-- If LuaRocks is installed, make sure that packages installed through it are
-- found (e.g. lgi). If LuaRocks is not installed, do nothing.
pcall(require, "luarocks.loader")

-- Standard awesome library
require("awful.autofocus")

require("awful.hotkeys_popup.keys")

-- {{{ Error handling
require("config.error")
-- }}}

-- {{{ Layout
require("config.layout")
-- }}}
-- {{{ Wibar
require("config.screens")
-- }}}

-- {{{ Mouse bindings
-- require("settings.mouse")
require("config.mouse")
-- }}}

-- {{{ Key bindings
require("config.keymaps")
-- }}}

-- {{{ Rules
require("config.rules")
-- }}}

-- {{{ Signals
-- require("settings.signals")
require("config.signals")
-- }}}
--
require("autostart")
