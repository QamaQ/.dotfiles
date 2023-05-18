local M = {}

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
-- if you just want default config for the servers then put them in a table
M.servers = { "html", "cssls", "tsserver", "clangd", "pyright", "yamlls", "lua_ls"}

local opts = {}

for _, lsp in ipairs(M.servers) do
  opts = {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  if lsp == 'pyright' then
    local settings = {}
    opts = vim.tbl_deep_extend("force", settings, opts)
  end
  if lsp == 'lua_ls' then
  end
  lspconfig[lsp].setup{opts}
end




vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = false,
  update_in_insert = true,
  severity_sort = false,
})

return M
