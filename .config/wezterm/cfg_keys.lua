local wezterm = require "wezterm"
local mytable = require "lib/mystdlib".mytable
local mods = require "cfg_utils".mods

local active = wezterm.action

local cfg = {}

cfg.disable_default_key_bindings = true

cfg.keys = {
	{ key = 'f', mods = 'ALT', action = active.ToggleFullScreen },
	--Split Horizontal
	{ key = 'Enter', mods = 'ALT', action = active.SplitHorizontal { domain = 'CurrentPaneDomain' } },
	--Split vertical
	{ key = 'Enter', mods = 'ALT | SHIFT', action = active.SplitVertical { domain = 'CurrentPaneDomain' } },
	--close pane

	{ key = 'w', mods = 'ALT', action = active.CloseCurrentPane { confirm = true } },

	--Copy and Paste
	{ key = 'c', mods = 'CTRL | SHIFT', action = active.Copy },
	{ key = 'v', mods = 'CTRL | SHIFT', action = active.Paste },

	--reload config
	{ key = 'r', mods = 'ALT', action = active.ReloadConfiguration },

	-- view Error configs
	{ key = 'l', mods = 'ALT | SHIFT',  action = active.ShowDebugOverlay },

	--Font size
	{ key = '+', mods = 'CTRL', action = active.IncreaseFontSize },
	{ key = '-', mods = 'CTRL', action = active.DecreaseFontSize },

	--
	{ key = 'LeftArrow', mods = 'CTRL|SHIFT', action = active.ActivatePaneDirection 'Left' },
	{ key = 'RightArrow', mods = 'CTRL|SHIFT', action = active.ActivatePaneDirection 'Right' },
    { key = 'UpArrow', mods = 'CTRL|SHIFT', action = active.ActivatePaneDirection 'Up' },
    { key = 'DownArrow', mods = 'CTRL|SHIFT', action = active.ActivatePaneDirection 'Down' },
}


return cfg
