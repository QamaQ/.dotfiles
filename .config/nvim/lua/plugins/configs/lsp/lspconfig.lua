-- require("plugins.configs.lsp.lspsettings")

local lspconfig = require("lspconfig")
local handlers = require("plugins.configs.lsp.handlers")
local servers = handlers.servers
local opts = {}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup{
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }
end



lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/extensions/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        -- maxPreload = 100000,
        -- preloadFileSize = 10000,
      },
    },
  },
}

