-- Función `on_attach`
-- Se ejecuta cuando un servidor de lenguaje se adjunta a un buffer.
-- Aquí se definen los atajos de teclado específicos para LSP y la auto-formateo al guardar.
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr } -- Opciones base para los atajos de teclado

    -- Atajos de teclado para funcionalidades de LSP
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)          -- Ir a la definición
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)          -- Encontrar referencias
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)                -- Mostrar información al pasar el ratón
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)      -- Renombrar símbolo
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Acciones de código
    vim.keymap.set("n", "<leader>lf", function()                     -- Formatear el buffer
        vim.lsp.buf.format({ async = true })
    end, opts)

    -- Auto-formateo al guardar si el servidor de lenguaje lo soporta
    if client:supports_method("textDocument/formatting") then
        -- Crea un grupo de autocomandos para evitar duplicados
        local group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, { clear = true })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = group,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ bufnr = bufnr, async = false }) -- Formatea el buffer antes de guardar
            end,
        })
    end
end

-- Capacidad de cliente LSP
-- Se usa para comunicar las capacidades del cliente (Neovim) al servidor de lenguaje.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true


return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },      -- Carga el plugin al abrir o crear un nuevo buffer
        config = function()
            local border = "rounded"                 -- Define el estilo del borde para las ventanas flotantes
            local severity = vim.diagnostic.severity -- Acceso rápido a los niveles de severidad de diagnóstico


            vim.diagnostic.config({
                virtual_text = { prefix = "" }, -- Prefijo para el texto virtual de diagnósticos
                signs = { -- Define los íconos para cada nivel de severidad de diagnóstico
                    text = {
                        [severity.ERROR] = "󰅙", -- Ícono para errores
                        [severity.WARN]  = "", -- Ícono para advertencias
                        [severity.INFO]  = "󰋼", -- Ícono para información
                        [severity.HINT]  = "󰌵", -- Ícono para sugerencias
                    },
                },
                update_in_insert = true,     -- Actualiza los diagnósticos en tiempo real en modo inserción
                float = { border = border }, -- Aplica el estilo de borde a las ventanas flotantes de diagnóstico
            })

            vim.lsp.config('lua_ls', {
                on_attach = on_attach,
                capabilities = capabilities, -- Pasa las capacidades del cliente
            })
            vim.lsp.config('pyright', {
                on_attach = on_attach,
                capabilities = capabilities, -- Pasa las capacidades del cliente
            })
            vim.lsp.config('pylsp', {
                on_attach = on_attach,
                capabilities = capabilities, -- Pasa las capacidades del cliente
            })
            -- vim.lsp.config('marksman', {})
            vim.lsp.config('markdown_oxide', {
                cmd = { 'markdown-oxide' },
                filetypes = { 'markdown' },
                root_markers = { '.git', '.obsidian', '.moxide.toml' },
                capabilities = capabilities,
            })
            vim.lsp.enable({ "lua_ls", "pylsp", "pyright" })
        end
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            -- library = {
            --     -- See the configuration section for more details
            --     -- Load luvit types when the `vim.uv` word is found
            --     -- { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            -- },
        },
    },
}
