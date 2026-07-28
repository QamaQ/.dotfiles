return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  keys = {
    { "<leader>gd", "<cmd>CodeDiff<CR>", desc = "Git diff explorer" },
    { "<leader>gh", "<cmd>CodeDiff history<CR>", desc = "Git history" },
  },
}
