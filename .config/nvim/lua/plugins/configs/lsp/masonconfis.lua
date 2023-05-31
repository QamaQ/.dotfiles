
local mason_lspconfig = require("mason-lspconfig")

local servers = require("plugins.configs.lsp.handlers")

mason_lspconfig.setup {
  -- ensure_installed = options.ensure_installed,
  ensure_installed = servers.servers,
  automatic_installation = true,
}

