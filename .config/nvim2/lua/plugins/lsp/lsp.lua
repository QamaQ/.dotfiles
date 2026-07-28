local icons = require("core.icons")

local servers = {
    lua_ls = require("config.lsp.servers.lua_ls"),
    pyright = require("config.lsp.servers.pyright"),
    ruff = require("config.lsp.servers.ruff"),
}

return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local border = "rounded"
        local severity = vim.diagnostic.severity

        vim.diagnostic.config({
            virtual_text = {
                prefix = "",
                spacing = 2,
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
            float = {
                border = border,
                focusable = false,
                source = "always",
                header = "",
                prefix = " ",
            },
        })

        vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
            config = vim.tbl_deep_extend("force", config or {}, { border = border })
            vim.lsp.handlers.hover(err, result, ctx, config)
        end
        vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
            config = vim.tbl_deep_extend("force", config or {}, { border = border })
            vim.lsp.handlers.signature_help(err, result, ctx, config)
        end

        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
        vim.keymap.set("n", "<leader>dd", vim.diagnostic.open_float, { desc = "Line diagnostics" })
        vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostics in loclist" })
        vim.keymap.set("n", "<leader>dq", function()
            vim.diagnostic.setqflist()
        end, { desc = "Diagnostics in qflist" })

        vim.keymap.set("n", "<leader>ui", function()
            local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = 0 })
            vim.lsp.inlay_hint.enable(not enabled, { bufnr = 0 })
        end, { desc = "Toggle inlay hints" })

        local lsp_core = require("core.lsp")
        vim.keymap.set("n", "<leader>uP", lsp_core.restart_python_servers, { desc = "Restart Python LSP" })
        vim.api.nvim_create_user_command("PythonLspRestart", lsp_core.restart_python_servers, {})

        local last_focus_loss = 0
        local augroup = vim.api.nvim_create_augroup("PythonLspAutoRestart", { clear = true })
        vim.api.nvim_create_autocmd("FocusLost", {
            group = augroup,
            callback = function()
                last_focus_loss = vim.uv.now()
            end,
            desc = "Track when focus was lost",
        })
        vim.api.nvim_create_autocmd("FocusGained", {
            group = augroup,
            callback = function()
                if vim.uv.now() - last_focus_loss > 5 then
                    lsp_core.restart_python_servers()
                end
            end,
            desc = "Restart Python LSP on focus (if away >5s)",
        })
        vim.api.nvim_create_autocmd("BufWritePost", {
            group = augroup,
            pattern = { "requirements*.txt", "pyproject.toml", "setup.py", "setup.cfg", "Pipfile*" },
            callback = function()
                lsp_core.restart_python_servers()
            end,
            desc = "Restart Python LSP after dependency change",
        })

        local names = {}
        for name, s in pairs(servers) do
            vim.lsp.config(name, s.config)
            table.insert(names, name)
        end

        vim.lsp.enable(names)
    end,
}
