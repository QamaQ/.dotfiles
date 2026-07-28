-- local py = require("config.lang.python")

return function(on_attach)
  vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    on_attach = on_attach,
  })
end
