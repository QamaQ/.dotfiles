return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local map = vim.keymap.set

      map("n", "]h", gs.next_hunk, { desc = "Siguiente hunk (Git)", buffer = bufnr })
      map("n", "[h", gs.prev_hunk, { desc = "Anterior hunk (Git)", buffer = bufnr })
      map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk", buffer = bufnr })
      map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk", buffer = bufnr })
      map("n", "<leader>hb", gs.blame_line, { desc = "Blame línea", buffer = bufnr })
    end,
  },
}
