local icons = require("config.core").icons
local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufEnter",
  cmd = "Gitsigns",
  opts = {
    signs = {
      add = { text = icons.ui.lineVerticalLeft },
      change = { text = icons.ui.lineVerticalLeft },
      delete = { text = icons.ui.lineVerticalLeft },
      topdelete = { text = icons.ui.lineVerticalLeft },
      changedelete = { text = icons.ui.lineVerticalLeft },
      untracked = { text = icons.ui.lineVerticalLeft },
    }
  }
}

return M

