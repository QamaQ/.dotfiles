-- ============================================================================
-- Material Darker Colorscheme
-- ============================================================================

return {
    {
        -- Plugin local: Material Darker theme
        "material", -- Asumiendo que es el tema "material-theme" de sainnhe
        dir = "~/Code/plugins/material (Copiar)/",
        -- lazy = true,     -- Carga el plugin al inicio de Neovim
        priority = 1000, -- Asegura que se cargue antes que otros plugins que dependan de resaltados

        -- Configuración del plugin
        config = function()
            -- vim.g.material_style = "darker"
            require("material").setup({
                style = "darker",
            })
            -- vim.cmd("colorscheme material-darker") -- Aplica el esquema de colores 'material'
        end,

        -- Opcional: Dependencias (si las hay)
        -- dependencies = {},
    },

}
