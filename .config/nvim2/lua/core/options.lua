local opt = vim.opt

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.number = true
vim.o.termguicolors = true
vim.o.confirm = true
vim.o.signcolumn = "yes"
vim.o.hidden = true
vim.o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.fillchars = {
    eob = ' ',
}
vim.o.swapfile = false

vim.opt.cursorline = false

opt.undofile = true
opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.fn.mkdir(vim.o.undodir, "p")

opt.splitright = true
opt.splitbelow = true

opt.scrolloff = 4
opt.sidescrolloff = 4

opt.inccommand = "split"

opt.list = false
opt.listchars = { tab = "▸ ", trail = "·", extends = ">", precedes = "<" }

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false
opt.laststatus = 3
opt.cmdheight = 0

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitkeep = "screen"

vim.o.mouse = "a"
vim.o.updatetime = 200
vim.o.timeoutlen = 300
vim.o.completeopt = "menu,menuone,noselect"
vim.opt.shortmess:append({ W = true, I = true, c = true })
vim.o.showmode = false
vim.o.conceallevel = 2

require("vim._core.ui2").enable()
