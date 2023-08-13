-- -- This file is automatically loaded by plugins.config
vim.g.mapleader = " "
vim.g.maplocalleader = " "
--
local opt = vim.opt
local icons = require("core.icons")
opt.autowrite = true -- Enable auto write
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = false -- Enable highlighting of the current line
opt.list = false -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
--
-- -- numbers
--opt.number = true -- Print line number
-- opt.numberwidth = 4
opt.ruler = false
--
opt.pumblend = 6 -- Popup blend
opt.pumheight = 6 -- Maximum number of entries in a popup
opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
--opt.shiftround = true         -- Round indent
--opt.shortmess:append({ W = true, I = true, c = true })
opt.showmode = true -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context

-- indenting
opt.autoindent = true
opt.tabstop = 2 -- Number of spaces tabs count for
opt.shiftwidth = 2 -- Size of an indent
opt.expandtab = true -- Use spaces instead of tabs
opt.smartindent = true -- Insert indents automatically
opt.softtabstop = 2

-- disalbe nvim intro
opt.shortmess:append("sI")

-- search settings
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals

-- appearance
opt.termguicolors = true -- True color support
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.background = "dark"

-- backsapce
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- Sync with system clipboard

-- split windows
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current

-- tabline
opt.showtabline = 0

opt.timeoutlen = 300
--opt.wildmode = "longest:full,full" -- Command-line completion mode
--opt.winminwidth = 2 -- Minimum window width
opt.wrap = false -- Disable line wrap
opt.backup = false
opt.swapfile = false

opt.updatetime = 200

if vim.fn.has("nvim1.9.0") == 1 then
	opt.splitkeep = "screen"
	opt.shortmess:append({ C = true })
end

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- vim.opt.fillchars.eob = "  "
-- vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
-- vim.opt.fillchars = vim.opt.fillchars + "vertright: "

vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append({
	stl = " ",
})

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

vim.opt.shortmess:append("c")

vim.filetype.add({
	extension = {
		conf = "dosini",
	},
})

vim.opt.fillchars = {
	eob = " ", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alternatives = ⣿ ░ ─
	msgsep = " ", -- alternatives: ‾ ─
	fold = " ",
	foldopen = icons.ui.ArrowOpen, -- '▼'
	foldclose = icons.ui.ArrowClosed, -- '▶'
	foldsep = " ",
}
opt.diffopt = opt.diffopt
	+ {
		"vertical",
		"iwhite",
		"hiddenoff",
		"foldcolumn:0",
		"context:4",
		"algorithm:histogram",
		"indent-heuristic",
		"linematch:60",
	}

opt.foldcolumn = "0" -- Show the fold column
opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
opt.foldlevelstart = 99
opt.foldenable = true

vim.o.guifont = "JetBrainsMono Nerd Font Mono:h14,codicon"
--
-- Documentation: https://neovim.io/doc/user/options.html
