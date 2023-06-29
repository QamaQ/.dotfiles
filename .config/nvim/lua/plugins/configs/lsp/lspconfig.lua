return {
    "neovim/nvim-lspconfig",

    dependencies = {
        { "folke/neodev.nvim", opts = {} },
        {
            "williamboman/mason.nvim",
            build = ":MasonUpdate",
            opts = {
                ensure_installed = {
                    "stylua",
                    -- "shellcheck",
                    -- "flake8",
                    "shfmt",
                    "mypy",
                    "ruff",
                    "black",
                },
            },
        },
        "williamboman/mason-lspconfig.nvim",
        "jay-babu/mason-null-ls.nvim",
    },
    config = function()
        -- Setup language servers.
        local lspconfig = require("lspconfig")
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_null_ls = require("mason-null-ls")
        local handlers = require("core.utils")
        mason.setup()
        mason_lspconfig.setup({
            ensure_installed = handlers.language_servers,
            automatic_installation = true,
        })
        mason_null_ls.setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "eslind_d",
                "mypy",
                "ruff",
                "black",
            },
        })

        -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
        local servers = handlers.language_servers

        for _, lsp in ipairs(servers) do
            lspconfig[lsp].setup({
                -- on_attach = my_custom_on_attach,
                --capabilities = handlers.capabilities,
            })
        end

        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace",
                    },
                    diagnostics = {
                        globals = { "vim" },
                    },
                    telemetry = {
                        enable = false,
                    },
                },
            },
        })

        lspconfig.ltex.setup({
            settings = {
                ltex = {
                    language = { "es", "en" },
                },
            },
        })
    end,
}
