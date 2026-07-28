local M = {}

local utils = require("config.statusline.utils")
local ignore = require("config.statusline.ignore")
local mode = require("config.statusline.mode")
local file = require("config.statusline.file")
local git = require("config.statusline.git")
local diff = require("config.statusline.diff")
local diagnostics = require("config.statusline.diagnostics")
local position = require("config.statusline.position")

function M.statusline()
  -- if ignore.should_ignore() then return "%#StatusLine#%=" end

  return table.concat({
    mode.get(),
    file.get(),
    git.get(),
    diff.get(),
    "%=%#StatusLine#",
    diagnostics.get(),
    position.get(),
  })
end

function M.setup()
  if utils.is_transparent() then
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = utils.get_hl("Comment", "fg") })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", fg = utils.get_hl("Comment", "fg") })
  end

  vim.o.statusline = "%!v:lua.require('config.statusline').statusline()"
  vim.api.nvim_create_autocmd("ColorScheme", { callback = function() M.setup() end })
end

return M
