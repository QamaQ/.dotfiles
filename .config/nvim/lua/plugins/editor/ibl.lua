local icons = require("config.core").icons
local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    indent = {
      char = icons.ui.lineVerticalLeft,
      tab_char = icons.ui.lineVerticalLeft,
    },
    scope = { enabled = false },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "trouble",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    },
  },
  main = "ibl",
}

return M
