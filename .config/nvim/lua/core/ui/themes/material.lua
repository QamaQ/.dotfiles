local M = {}

local status_material, material = pcall(require, "material")
if not status_material then
	return
end

vim.g.material_style = "darker"


local status_color, colors = pcall(require, "material.colors")
if not status_color then
	return
end


material.setup({

	contrast = {
		terminal = false, -- Enable contrast for the built-in terminal
		sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = false, -- Enable contrast for floating windows
		cursor_line = false, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable darker background for non-current windows
		filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
	},

	styles = { -- Give comments style such as bold, italic, underline etc.
		comments = { italic = true },
		strings = { --[[ bold = true ]]
		},
		keywords = { --[[ underline = true ]]
		},
		functions = { --[[ bold = true, undercurl = true ]]
		},
		variables = {},
		operators = {},
		types = {},
	},

	plugins = { -- Uncomment the plugins that you use to highlight them
		-- Available plugins:
		-- "dap",
		"dashboard",
		"gitsigns",
		-- "hop",
		"indent-blankline",
		-- "lspsaga",
		-- "mini",
		-- "neogit",
		"nvim-cmp",
		"nvim-navic",
		"nvim-tree",
		-- "nvim-web-devicons",
		-- "sneak",
		"telescope",
		"trouble",
		"which-key",
    -- "bufferline"
	},

	disable = {
		colored_cursor = false, -- Disable the colored cursor
		borders = false, -- Disable borders between verticaly split windows
		background = true, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false, -- Hide the end-of-buffer lines
	},

	high_visibility = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = true, -- Enable higher contrast text for darker style
	},

	lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

	async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

	custom_colors = function(colors)
    -- colors.editor.fg = "#EEFFFF"
  end, -- If you want to everride the default colors, set this to a function

	custom_highlights = {
    
  }, -- Overwrite highlights with your own
})



vim.cmd("colorscheme material")





local m = colors.main
local e = colors.editor
local g = colors.git
local l = colors.lsp
local s = colors.syntax
local b = colors.backgrounds

M.material_lualine = {
	normal = {
		a = { fg = e.accent, bg = e.bg, gui = "bold" },
		b = { fg = s.comments, bg = e.bg },
		c = { fg = s.comments, bg = e.bg },
	},
	insert = {
		a = { fg = m.green, bg = e.bg, gui = "bold" },
		b = { fg = s.comments, bg = e.bg },
	},
	visual = {
		a = { fg = m.purple, bg = e.bg, gui = "bold" },
		b = { fg = s.comments, bg = e.bg },
	},
	replace = {
		a = { fg = m.red, bg = e.bg, gui = "bold" },
		b = { fg = s.comments, bg = e.bg },
	},
	command = {
		a = { fg = m.yellow, bg = e.bg, gui = "bold" },
		b = { fg = s.comments, bg = e.bg },
	},
	inactive = {
		a = { fg = e.disabled, bg = e.bg },
		b = { fg = e.disabled, bg = e.bg },
		c = { fg = e.disabled, bg = e.bg },
	},
}
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

lualine.setup({ options = { theme = M.material_lualine } })





return M
