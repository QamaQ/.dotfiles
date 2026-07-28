return function(on_attach)
  vim.lsp.config("qmlls", {
    cmd = { "qmlls6" },
    filetypes = { "qml", "qmldir" },
    on_attach = on_attach,
    before_init = function(params, _)
      if params.capabilities and params.capabilities.textDocument then
        params.capabilities.textDocument.semanticTokens = nil
      end
    end,
    settings = {
      qmlls = {
        formatterOptions = {
          indentWidth = 2,
        },
      },
    },
  })
end
