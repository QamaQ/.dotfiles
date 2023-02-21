local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local servers = {
  "lua_ls",
  "bashls",
  "pyright"
}

local settings = {
  ui = {
    border = "rounded",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true,
}

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local handlers = require("plugins.configs.lsp.handlers")

local opts = {}


for _, server in pairs(servers) do
  opts = {
    on_attach = handlers.on_attach,
    flags = handlers.lsp_flags,
    capabilities = handlers.capabilities,
  }

  if server == "bashls" then
    local bash_opts = require("plugins.configs.lsp.settings.bashls")
    opts = vim.tbl_deep_extend("force", bash_opts, opts)
  end

  if server == "lua_ls" then
    local neodev_status_ok, neodev = pcall(require, "neodev")
    if not neodev_status_ok then
      return
    end
    neodev.setup()
  end

  if server == "pyright" then
    local pyright_opts = {}
  end

  lspconfig[server].setup(opts)
end
