local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
	return
end

local icons = require('core.ui.icons')

local diagnostics  = {
	"diagnostics",
	symbols = {
		error = icons.diagnostics.Error,
		warn = icons.diagnostics.Warning,
		hint = icons.diagnostics.Hint,
		info = icons.diagnostics.Information
	},
	colored = true,
	update_in_insert = true
}

local filename = {
	'filename'
}

local function info()
	return "%{coc#status()}%{get(b:,'coc_current_function','')}"
end

local mode = {
	'mode',
	fmt = function (args)
		return args
	end
}

local branch = {

}



local diff = {
	'diff',
}


lualine.setup {
  	options = {
    	icons_enabled = true,
    	--theme = 'auto',
    	component_separators = { left = '', right = ''},
    	section_separators = { left = '', right = ''},
    	always_divide_middle = true,
    	globalstatus = true,
  	},
  	sections = {
    	lualine_a = {mode},
    	lualine_b = {filename, diagnostics},
    	lualine_c = {},
    	lualine_x = {info},
    	lualine_y = {},
    	lualine_z = {'branch',diff}
  	},
  	inactive_sections = {
    	lualine_a = {},
    	lualine_b = {},
    	lualine_c = {'filename'},
    	lualine_x = {'location'},
    	lualine_y = {},
    	lualine_z = {}
  	},
}
