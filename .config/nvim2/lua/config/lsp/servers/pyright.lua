local lsp = require("core.lsp")

return {
    name = "pyright",
    config = {
        on_attach = lsp.on_attach,
        capabilities = lsp.capabilities,
        settings = {
            python = {
                analysis = {
                    typeCheckingMode = "basic",
                    autoImportCompletions = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = "workspace",
                    autoSearchPaths = true,
                },
            },
        },
    },
}
