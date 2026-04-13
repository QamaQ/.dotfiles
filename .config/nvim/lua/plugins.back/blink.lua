local kinds = require("core.icons.kinds") -- Carga las definiciones de íconos personalizadas

return {
    'saghen/blink.cmp', -- Define el plugin Blink (para autocompletado)
    dependencies = {
        -- Provides snippets for the snippet source
        "rafamadriz/friendly-snippets",
        {
            "Kaiser-Yang/blink-cmp-dictionary",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
    },
    -- version = "1.*",    -- Versión opcional del plugin (comentada)
    lazy = false,                        -- Carga el plugin al inicio de Neovim
    opts_extend = { "sources.default" }, -- Extiende opciones predeterminadas de fuentes
    config = function()                  -- Función de configuración que se ejecuta cuando el plugin es cargado
        require("blink.cmp").setup({     -- Inicializa y configura Blink

            appearance = {
                use_nvim_cmp_as_default = true, -- Usa nvim-cmp como el proveedor de completado predeterminado
                kind_icons = kinds              -- Asigna los íconos personalizados para los tipos de símbolos
            },
            keymap = {
                preset = 'none',                                                        -- Deshabilita los atajos de teclado preestablecidos
                ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' }, -- Ctrl+Espacio: mostrar/ocultar documentación
                ['<S-Tab>'] = { 'select_prev', 'fallback' },                            -- Shift+Tab: seleccionar elemento anterior o usar fallback
                ['<Tab>'] = { 'select_next', 'fallback' },                              -- Tab: seleccionar elemento siguiente o usar fallback
                ['<CR>'] = { 'accept', 'fallback' },                                    -- Enter: aceptar sugerencia o usar fallback
            },
            sources = {
                -- default = { "lsp", "buffer", "path", "dictionary" },  -- Define las fuentes de completado predeterminadas
            },
            completion = {
                menu = {
                    -- border = "rounded", -- Defaults to `vim.o.winborder` on nvim 0.11+ (comentado)
                    scrollbar = false,       -- Deshabilita la barra de desplazamiento en el menú de completado
                    draw = {
                        align_to = 'cursor', -- Alinea el menú de completado al cursor
                        -- columns = {         -- Columnas del menú (comentado)
                        --   { "kind_icon" },
                        --   { "label" },
                        --   { "kind" },
                        --   { "source_name" },
                        -- },
                    },
                },
                list = {
                    selection = {
                        preselect = false,  -- No preselecciona automáticamente el primer elemento
                        auto_insert = false -- No inserta automáticamente la sugerencia
                    }
                }
            },

            fuzzy = { implementation = "lua" }, -- Configura la búsqueda difusa con implementación en Lua
        })
    end
}
