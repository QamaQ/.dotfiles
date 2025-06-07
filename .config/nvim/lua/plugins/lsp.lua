-- lazy.nvim
return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
  enabled = true,
  init = function()
    vim.diagnostic.config({
      update_in_insert = true,
      virtual_text = true,
      virtual_lines = false,
      severity_sort = false,
      underline = true,
    })
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright", "lua_ls" },
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")

    -- Configura manualmente cada servidor
    lspconfig.pyright.setup {}
    -- require("lspconfig").pyright.setup({})
    lspconfig.lua_ls.setup {}
  end,
}
