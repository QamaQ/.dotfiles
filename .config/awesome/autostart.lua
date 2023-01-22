local awful = require("awful")
local gears = require("gears")

local function run_once(cmd)
	local findme = cmd
	local firstspace = cmd:find(" ")
	if firstspace then
		findme = cmd:sub(0, firstspace - 1)
	end
	awful.spawn.with_shell(string.format("pgrep -u $USER -x %s > /dev/null || (%s)", findme, cmd), false)
end

-- picom

run_once("picom  --config " .. gears.filesystem.get_configuration_dir() .. "app_configs/picom.conf")
run_once("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

-- return autostart
