return {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleToggle" },
  opts = {
    auto_close = true,
    auto_preview = false,
    focus = false,
    modes = {
      diagnostics = {
        mode = "diagnostics",
        preview = {
          type = "main",
          scratch = true,
        },
      },
    },
  },
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnósticos (Trouble)" },
    { "<leader>xw", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Diagnósticos del buffer (Trouble)" },
  },
}
