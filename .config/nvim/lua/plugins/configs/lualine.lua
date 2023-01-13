local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local status_nonicons, nonicons = pcall(require, "nvim-nonicons")
if not status_nonicons then
  return
end
local status_nicons_extention, nonicons_extension = pcall(require, "nvim-nonicons.extentions.lualine")
if not status_nicons_extention then
  return
end

local icons = require("core.ui.icons")

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	symbols = {
		error = icons.diagnosticSign.Error,
		warn = icons.diagnosticSign.Warning,
		info = icons.diagnosticSign.Information,
		hint = icons.diagnosticSign.Hint,
	},
	colored = true,
}

local branch = {
	"branch",
	-- icon = "",
  icon = nonicons.get("git-branch")
}

local diff = {
	"diff",
	colored = true,
	symbols = {
		added = icons.git.Add,
		modified = icons.git.Mod,
		removed = icons.git.Remove,
	},
}


lualine.setup({
	options = {
		icons_enabled = true,
		component_separators = { left = " ", right = " " },
		section_separators = { left = " ", right = " " },
		disabled_filetypes = {
			statusline = { "alpha", "dashboard" },
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { nonicons_extension.mode },
		lualine_b = { diagnostics },
		lualine_c = {  },
		lualine_x = {  },
		lualine_y = { branch, diff },
		lualine_z = { "fileformat" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})


