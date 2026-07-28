vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.number = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.o.laststatus = 3
vim.opt.fillchars:append({ eob = " " })

require('vim._core.ui2').enable({
  enable = false,
})
