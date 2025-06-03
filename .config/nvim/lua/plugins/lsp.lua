-- lazy.nvim
return {
  "neovim/nvim-lspconfig",
  enabled = true,
  init = function()
    vim.diagnostic.config({
      update_in_insert = true,
      virtual_text = true,
      virtual_lines = false,
      severity_sort = false,
      underline = true,
    })
    require("lspconfig").pyright.setup({})
    require("lspconfig").lua_ls.setup({})
  end,
}
