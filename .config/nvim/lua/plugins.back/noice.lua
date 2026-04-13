return {
    {
        "folke/noice.nvim",                                                  -- Plugin para mejorar la UI de Neovim, haciendo los mensajes menos intrusivos
        event = "VeryLazy",                                                  -- Carga el plugin de forma "muy perezosa" (después de que Neovim esté listo)
        -- enabled = false,                                                     -- El plugin está deshabilitado por defecto
        opts = {                                                             -- Opciones de configuración para noice.nvim
            -- add any options here (añade cualquier opción aquí)
            lsp = {                                                          -- Configuraciones relacionadas con el Protocolo del Servidor de Lenguaje (LSP)
                progress = { enabled = false },                              -- Deshabilita la visualización del progreso de LSP en noice
                override = {                                                 -- Anula las funciones predeterminadas de Neovim para una mejor integración con noice
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true, -- Sobrescribe la conversión de entrada a markdown
                    ["vim.lsp.util.stylize_markdown"] = true,                -- Sobrescribe la estilización de markdown
                    ["cmp.entry.get_documentation"] = true,                  -- Requiere hrsh7th/nvim-cmp, sobrescribe la obtención de documentación
                },
                signature = {                                                -- Configuración para la ayuda de firma de funciones
                    auto_open = {
                        enabled = false                                      -- Deshabilita la apertura automática de la ayuda de firma
                    }
                }
            },
            presets = {                       -- Configuraciones preestablecidas para noice.nvim
                bottom_search = true,         -- Mueve los mensajes de búsqueda a la parte inferior
                command_palette = true,       -- Habilita la paleta de comandos
                long_message_to_split = true, -- Convierte mensajes largos en una ventana dividida
            },
        },
        dependencies = {                              -- Dependencias del plugin
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            { "MunifTanjim/nui.nvim", lazy = false }, -- (Comentado) Posible dependencia de UI
            -- OPTIONAL:                 -- (Comentado) nvim-notify es opcional para notificaciones
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            -- { "rcarriga/nvim-notify", enabled = false, opts = { background_colour = "#000000" } }, -- (Comentado) Plugin para notificaciones, deshabilitado
        }
    },

    { "MunifTanjim/nui.nvim", lazy = false }, -- (Comentado) Posible dependencia de UI
}
