---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", "window left" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<cr>", "window right" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<cr>", "window down" },
    ["<c-k>"] = { "<cmd>TmuxNavigateUp<cr>", "window up" }
  },
}

-- more keybinds!

return M
