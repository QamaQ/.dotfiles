-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
local g = vim.g

g.autoformat = true
opt.number = true

opt.laststatus = 3 -- global statusline
opt.mouse = "a" -- Enable mouse mode
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2 -- Number of spaces tabs count for
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.autowrite = true -- Enable auto write
opt.expandtab = true -- Use spaces instead of tabs
opt.showmode = false -- Dont show mode since we have a statusline
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.wrap = false -- Disable line wrap
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
