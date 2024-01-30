local M = {}

M.servers = { "lua_ls", "pyright" }
M.mason_server = function()
  local server = { "tsserver" }
  for _, serv_a in ipairs(M.servers) do
    table.insert(server, serv_a)
  end

  return server
end



local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true, desc = nil }
  local builtin = require("telescope.builtin")
  local keymap = vim.keymap.set

  keymap("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Declaraciones" })
  keymap("n", "gd", builtin.lsp_definitions, { buffer = bufnr, desc = "Funciones definidas" })
  keymap("n", "gr", builtin.lsp_references, { buffer = bufnr, desc = "Referencias" })
  keymap("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Mostrar documentacion" })
  keymap("n", "gK", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Ayuda de firma" })
  keymap("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Renombrar" })
  keymap("n", "gL", function() vim.lsp.buf.format { async = true } end, { buffer = bufnr, desc = "Formatear código" })
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
end

function M.capabilities()
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    return cmp_nvim_lsp.default_capabilities()
  end
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  return capabilities
end

return M
