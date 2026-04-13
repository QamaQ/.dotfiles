-- Handlers personalizados para ventanas flotantes de LSP
-- Usa 'vim.lsp.with' para añadir un borde redondeado a las ventanas de hover y signature help.
vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, { border = border })          -- Añade borde a la ventana de información al pasar el ratón
vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }) -- Añade borde a la ventana de ayuda de firma
