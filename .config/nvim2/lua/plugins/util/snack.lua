return {
    "folke/snacks.nvim",
    event = "VeryLazy",
    -- enabled = false,     -- Opción para deshabilitar el plugin (comentada, por lo que está habilitado)
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        quickfile = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { folds = { open = false } },
        words = { enabled = true },
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
