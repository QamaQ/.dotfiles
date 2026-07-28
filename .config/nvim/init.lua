require("core.options")
require("core.keymaps")
require("core.lazy")
require("config.autocmds")
require("config.statusline").setup()
vim.api.nvim_create_autocmd("UIEnter", {
  once = true,
  callback = function()
    require("config.lsp")
  end,
})

require("core.keymaps").register({
  { "<leader>un", require("utils").toggle_numbers, desc = "Toggle numbers" },
  { "<C-t>", require("config.terminal").toggle, desc = "Toggle terminal" },
  { "<C-t>", function() require("config.terminal").toggle() end, desc = "Toggle terminal", mode = "t" },
})
