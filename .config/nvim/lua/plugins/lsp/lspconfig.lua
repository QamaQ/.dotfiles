return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true, dependencies = { "nvim-lspconfig" } },
    { "folke/neodev.nvim", opts = {} },
    --'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    "mason.nvim",
  },
  opts = {},
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local neodev = require("neodev")
    local Util = require("lazyvim.util")
    local utils = require("utils.lsp")

    Util.format.register(Util.lsp.formatter())
    if opts.autoformat ~= nil then
      vim.g.autoformat = opts.autoformat
      Util.deprecate("nvim-lspconfig.opts.autoformat", "vim.g.autoformat")
    end


    require("neoconf").setup()
    vim.diagnostic.config({
      update_in_insert = true,
      virtual_text = true,
      signs = true,
    })


    local servers = utils.servers

    for _, lsp in ipairs(servers) do
      local opts_server = {
        capabilities = utils.capabilities(),
        on_attach = utils.on_attach
      }
      local require_ok, settings = pcall(require, "plugins.lsp.servers." .. lsp)
      if require_ok then
        opts = vim.tbl_deep_extend("force", settings, opts)
      end

      if lsp == "lua_ls" then
        neodev.setup{}
      end

      lspconfig[lsp].setup(opts_server)
    end
  end
}
