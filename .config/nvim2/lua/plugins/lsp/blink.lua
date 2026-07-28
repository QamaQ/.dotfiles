local kinds = require("core.icons.kinds") -- Carga las definiciones de íconos personalizadas

return {
    'saghen/blink.cmp',
    event = "InsertEnter",
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
            appearance = {
                use_nvim_cmp_as_default = true, -- Usa nvim-cmp como el proveedor de completado predeterminado
                kind_icons = kinds              -- Asigna los íconos personalizados para los tipos de símbolos
            },
            sources = {
                default = { "lazydev", "lsp", "path", "snippets", "buffer" },
                providers = {
                  lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                  },
                },
            },
            keymap = {
                preset = 'none',                                                        -- Deshabilita los atajos de teclado preestablecidos
                ['<C-Space>'] = { 'show', 'show_documentation', 'hide_documentation' }, -- Ctrl+Espacio: mostrar/ocultar documentación
                ['<S-Tab>'] = { 'select_prev', 'fallback' },                            -- Shift+Tab: seleccionar elemento anterior o usar fallback
                ['<Tab>'] = { 'select_next', 'fallback' },                              -- Tab: seleccionar elemento siguiente o usar fallback
                ['<CR>'] = { 'accept', 'fallback' },                                    -- Enter: aceptar sugerencia o usar fallback
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
    },
    opts_extend = { "sources.default" }
}
