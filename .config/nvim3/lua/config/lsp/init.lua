local severity = vim.diagnostic.severity
local icons = require("core.icons")
vim.diagnostic.config({
  virtual_text = {
    prefix = "",
  },
  signs = {
    active = true,
    text = {
      [severity.ERROR] = icons.diagnostics.error,
      [severity.WARN] = icons.diagnostics.warning,
      [severity.INFO] = icons.diagnostics.info,
      [severity.HINT] = icons.diagnostics.hint,
    },
  },
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
end

local servers = { "lua_ls", "pyright", "ts_ls", "rust_analyzer", "pylsp" }

for _, name in ipairs(servers) do
  require("config.lsp.servers." .. name)(on_attach)
end

vim.schedule(function()
  local ok, blink = pcall(require, "blink.cmp")
  if ok then
    local capabilities = blink.get_lsp_capabilities()
    for _, name in ipairs(servers) do
      vim.lsp.config(name, { capabilities = capabilities })
    end
  end
  vim.lsp.enable(servers)
end)
