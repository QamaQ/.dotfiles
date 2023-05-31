vim.opt.number = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct


vim.opt.wrap = false

vim.opt.laststatus = 0  -- statusline options
vim.opt.showmode = false
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.cmdheight = 0
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 1000
vim.opt.backup = false

-- buffer-scoped
vim.opt.autoindent = true

-- window-scoped
vim.opt.cursorline = false

-- global scope
vim.opt.autowrite = true

vim.opt.fillchars = vim.opt.fillchars + 'eob: '
vim.opt.fillchars:append{
	stl = ' ',
}

vim.opt.shortmess:append "c"


