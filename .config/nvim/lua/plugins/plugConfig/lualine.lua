
local status_line, lualine = pcall(require, "lualine")
if not status_line then
	return
end

local icons = require("core.ui.icons")

local mode = {
	"mode",
	fmt = function(str)
		return ""
	end,
}

local filename = {
	"filename",
	file_status = true,
	newfile_status = true,
	path = 0,

	symbols = {
		modified = " ",
		readonly = " ",
		unnamed = " ",
		newfile = " ",
	},
    
}

local branch = {
	"branch",
	icon = "",
}

local diff = {
	"diff",
	symbols = {
		added = "",
		modified = "",
		removed = "",
	},
}

local diagnostics = {
	"diagnostics",
	symbols = {
		error = icons.diagnostics.Error,
		warn = icons.diagnostics.Warning,
		info = icons.diagnostics.Information,
		hint = icons.diagnostics.Hint,
	},
	update_in_insert = true,
}



local filetype = {
	"filetype",
	fmt = function(str)
		local ui_filetypes = {
			"help",
			"packer",
			"neogitstatus",
			"NvimTree",
			"Trouble",
			"lir",
			"Outline",
			"spectre_panel",
			"toggleterm",
			"DressingSelect",
			"",
			"nil",
		}
        if str == 'NvimTree' then
            return ''
        end
        if str == 'TelescopePrompt' then
            return ''
        end
        if str == "toggleterm" then
            return ''
        end
        if str == "packer" then
            return ''
        end
        if str == "Trouble" then
            return ''
        end
	end,
	icons_enabled = false,
	padding = 0,
}


lualine.setup({
	options = {
		icons_enabled = true,
		--theme = "auto",
		component_separators = { left = " ", right = " " },
		section_separators = { left = " ", right = " " },
		disabled_filetypes = {
			statusline = {
                "alpha",
                "dashboard"
            },
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
		lualine_a = { mode },
		lualine_b = { filename, diagnostics, filetype },
		lualine_c = {  },
		lualine_x = {},
		lualine_y = { },
		lualine_z = { branch, diff },
	},
	inactive_sections = {
		lualine_a = { mode },
		lualine_b = { filename, diagnostics, filetype },
		lualine_c = {  },
		lualine_x = {},
		lualine_y = {  },
		lualine_z = { branch, diff },
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})

