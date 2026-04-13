---@module 'lazy'

return {
    "folke/snacks.nvim", -- Define el plugin 'snacks.nvim', un conjunto de pequeñas utilidades y mejoras
    priority = 1000,     -- Alta prioridad para asegurar que se carga antes que otros plugins que puedan depender de él
    lazy = false,        -- Carga el plugin al inicio de Neovim
    -- enabled = false,     -- Opción para deshabilitar el plugin (comentada, por lo que está habilitado)
    ---@type snacks.Config
    opts = {             -- Opciones de configuración para los diferentes módulos de snacks.nvim
        -- your configuration comes here (tu configuración va aquí)
        -- or leave it empty to use the default settings (o déjalo vacío para usar las configuraciones predeterminadas)
        -- refer to the configuration section below (consulta la sección de configuración a continuación)
        bigfile = { enabled = true }, -- Habilita la gestión de archivos grandes
        dashboard = { enabled = false }, -- Deshabilita el módulo de dashboard
        explorer = { enabled = false }, -- Deshabilita el módulo de explorador
        indent = { -- Configuración para la indentación
            enabled = true, -- Deshabilita la característica de indentación
            chunk = { enabled = false }, -- Deshabilita la indentación por "chunks"
            -- enabled = true,         -- (Comentado)
            char = "▏", -- Carácter usado para mostrar la indentación
            indent = {
                char = "▏",
            },
            scope = {
                enabled = false,

            },

        },
        input = { enabled = true }, -- Habilita el módulo de entrada
        picker = { enabled = true }, -- Habilita el módulo de selección (picker)
        notifier = { enabled = false, sort = { "added" } }, -- Deshabilita el notificador, ordena por "added"
        quickfile = { enabled = true }, -- Habilita el módulo de archivo rápido
        scope = { enabled = false, indent = { char = "▏" } }, -- Configuración de scope, deshabilitado
        scroll = { enabled = true }, -- Habilita el módulo de desplazamiento
        statuscolumn = { -- Configuración de la columna de estado
            folds = { open = false }, -- Los pliegues (folds) no se muestran abiertos en la columna de estado
        },
        words = { enabled = true }, -- Habilita el módulo de palabras
    },
    keys = { -- Atajos de teclado personalizados para funcionalidades de snacks.nvim
        -- LSP (Language Server Protocol)
        { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Ir a Definición" }, -- gd: Ir a la definición de un símbolo
        { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Ir a Declaración" }, -- gD: Ir a la declaración de un símbolo
        { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                       desc = "Referencias" }, -- gr: Encontrar todas las referencias de un símbolo
        { "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Ir a Implementación" }, -- gI: Ir a la implementación de un símbolo
        { "gy",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Ir a Definición de Tipo" }, -- gy: Ir a la definición de tipo de un símbolo
        { "<leader>ss", function() Snacks.picker.lsp_symbols() end,           desc = "Símbolos LSP" }, -- <leader>ss: Buscar símbolos en el documento actual
        { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Símbolos del Workspace LSP" }, -- <leader>sS: Buscar símbolos en todo el workspace

        -- others (otros)
        -- { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" }, -- <leader>n: Mostrar historial de notificaciones (comentado)
        { "<leader>n",  function() Snacks.picker.notifications() end,         desc = "Historial de Notificaciones" }, -- <leader>n: Mostrar historial de notificaciones usando el picker
    }
}
