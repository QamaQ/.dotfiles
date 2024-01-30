return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
  build = ":MasonUpdate",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    'stevearc/conform.nvim',
  },

  config = function()
    local utils = require("utils.lsp")
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local conform = require("conform")
    mason.setup()
    mason_lspconfig.setup({
      ensure_installed = utils.mason_server()
    })

    conform.setup({
      formatters_by_ft = {
        python = { "black"}
      }
    })
  end
}

