return {
    'nvim-telescope/telescope.nvim',                       -- Define el plugin Telescope, un buscador difuso extensible para Neovim
    dependencies = { 'nvim-lua/plenary.nvim' },            -- Dependencia necesaria para Telescope
    -- enabled = false,
    opts = {                                               -- Opciones de configuración para Telescope
        defaults = {                                       -- Configuraciones predeterminadas que se aplican a todos los pickers de Telescope
            mappings = {                                   -- Mapeos de teclas personalizados para Telescope
                i = {                                      -- Mapeos en modo inserción
                    ["<C-j>"] = "move_selection_next",     -- Ctrl+j: Mueve la selección hacia abajo
                    ["<C-k>"] = "move_selection_previous", -- Ctrl+k: Mueve la selección hacia arriba
                },
            },
        },
    }
}
