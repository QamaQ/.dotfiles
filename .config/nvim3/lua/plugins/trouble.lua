return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
    { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics (Trouble)" },
    { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols (Trouble)" },
    { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP (Trouble)" },
    { "<leader>xL", "<cmd>Trouble loclist toggle<CR>", desc = "Location list (Trouble)" },
    { "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix list (Trouble)" },
  },
  opts = {},
}
