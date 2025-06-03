vim.g.mapleader = " "
require("themes.mi_tema").setup()
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  { import = "plugins" },
}, lazy_config)

-- load theme

require "configs.options"

vim.schedule(function()
  require "configs.mappings"
end)


-- require("core.lsp")
require("configs.autocmds")


-- vim.cmd 'colorscheme material'
