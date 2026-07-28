return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = "Neogit",
  cond = not vim.g.started_by_firenvim and not vim.g.vscode,
  init = function()
    require("core.keymaps").register({ "<leader>gp", "<cmd>Neogit<cr>", desc = "Panel" })
  end,
  opts = {
    disable_hint = true,
    disable_insert_on_commit = false,
    kind = "auto",
    signs = {
      hunk = { "", "" },
      item = { require("core.icons").arrow.right_short_thick, require("core.icons").arrow.down_short_thick },
      section = { require("core.icons").arrow.right_short_thick, require("core.icons").arrow.down_short_thick },
    },
    commit_editor = {
      kind = "split",
    },
    integrations = {
      snacks = true,
    },
  },
}
