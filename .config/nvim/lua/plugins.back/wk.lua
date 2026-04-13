return {
    "folke/which-key.nvim", -- Define el plugin 'which-key.nvim' para visualizar los atajos de teclado.
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    event = "VeryLazy",          -- Carga el plugin de forma "muy perezosa" (después de que Neovim esté listo).
    opts = {                     -- Opciones de configuración para which-key.nvim.
        plugins = {              -- Configuraciones para la integración con otras funcionalidades de Neovim.
            marks = true,        -- Habilita la visualización de los "marks" (marcadores de posición).
            registers = true,    -- Habilita la visualización de los "registers" (registros de pegado).
            spelling = {         -- Configuración de la integración con el corrector ortográfico.
                enabled = false, -- Deshabilita la visualización de atajos para el corrector ortográfico.
            },
        },
        layout = {            -- Configuración del diseño del menú de which-key.
            spacing = 4,      -- Espaciado entre los elementos del menú.
            align = "center", -- Alineación del menú de which-key (centrado).
        },
    },
}
