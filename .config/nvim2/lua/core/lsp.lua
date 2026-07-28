local M = {}

function M.on_attach(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>lf", function()
        vim.lsp.buf.format({ async = true })
    end, opts)

    if client:supports_method("textDocument/inlayHint") then
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    end

    if client:supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = false })
            end,
        })
    end

    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

function M.restart_python_servers()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local names = { "pyright", "basedpyright", "ruff", "pylsp" }
    for _, client in ipairs(clients) do
        for _, name in ipairs(names) do
            if client.name == name then
                client:stop()
                vim.defer_fn(function()
                    vim.lsp.start(name, { bufnr = 0 })
                end, 200)
                break
            end
        end
    end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

return M
