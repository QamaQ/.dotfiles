local lsp = require("core.lsp")

return {
    name = "lua_ls",
    config = {
        on_attach = lsp.on_attach,
        capabilities = lsp.capabilities,
        settings = {
            Lua = {
                runtime = { version = "LuaJIT" },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    checkThirdParty = false,
                    library = {
                        vim.fn.stdpath("data") .. "/lazy",
                        vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua",
                        "${3rd}/luv/library",
                        "${3rd}/busted/library",
                    },
                },
                completion = {
                    callSnippet = "Replace",
                },
                telemetry = { enable = false },
            },
        },
    },
}
