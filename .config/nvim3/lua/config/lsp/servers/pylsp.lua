return function(on_attach)
  vim.lsp.config("pylsp", {
    cmd = { "pylsp" },
    filetypes = { "python" },
    on_attach = on_attach,
    settings = {
      pylsp = {
        plugins = {
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          jedi_completion = { fuzzy = true },
          pyls_isort = { enabled = true },
          pylsp_mypy = { enabled = true },
          rope_completion = {
            enabled = true,
            eager = true,
          },
        },
      },
    },
  })
end
