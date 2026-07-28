local map = vim.keymap.set
return {
    "nvim-tree/nvim-tree.lua",                      -- Define el plugin NvimTree, un explorador de archivos para Neovim
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },    -- Define comandos para cargar el plugin solo cuando se usan
    opts = function()                               -- Función que devuelve la tabla de opciones de configuración
        return {
            filters = { dotfiles = false },         -- No oculta los archivos que empiezan con un punto (dotfiles)
            disable_netrw = true,                   -- Deshabilita el explorador de archivos predeterminado de Neovim (netrw)
            hijack_cursor = true,                   -- Mueve el cursor a la ventana de NvimTree al abrirlo
            sync_root_with_cwd = true,              -- Sincroniza la raíz del árbol con el directorio de trabajo actual
            update_focused_file = {                 -- Configuración para actualizar el archivo enfocado
                enable = true,                      -- Habilita la actualización del archivo enfocado
                update_root = false,                -- No actualiza la raíz del árbol al cambiar de archivo
            },
            view = {                                -- Configuración de la vista del árbol
                width = 30,                         -- Ancho de la ventana de NvimTree
                preserve_window_proportions = true, -- Mantiene las proporciones de las ventanas al redimensionar
            },
            renderer = {                            -- Configuración de cómo se renderiza el árbol
                root_folder_label = false,          -- No muestra una etiqueta para la carpeta raíz
                highlight_git = true,               -- Resalta archivos basados en el estado de Git
                indent_markers = { enable = true }, -- Muestra marcadores de indentación en el árbol
                icons = {                           -- Configuración de los glifos (íconos)
                    show = {
                        folder_arrow = false,
                    },
                    glyphs = {
                        default = "󰈚", -- Ícono predeterminado para archivos
                        folder = { -- Íconos para carpetas
                            default = "", -- Ícono de carpeta predeterminado
                            empty = "", -- Ícono de carpeta vacía
                            empty_open = "", -- Ícono de carpeta vacía abierta
                            open = "", -- Ícono de carpeta abierta
                            symlink = "", -- Ícono de enlace simbólico

                        },
                        git = { unmerged = "" }, -- Ícono para archivos con conflictos de Git
                    },
                },
            },
            on_attach = function(bufnr)
                local api = require("nvim-tree.api")

                -- Default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- Custom mappings
                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, silent = true, nowait = true }
                end
                map("n", "<cr>", api.node.open.no_window_picker, opts("Open: No Window Picker"))
                map("n", "<2-LeftMouse>", api.node.open.no_window_picker, opts("Open: No Window Picker"))
            end,
        }
    end,
}
