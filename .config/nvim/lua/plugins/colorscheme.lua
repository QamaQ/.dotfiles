-- ============================================================================
-- Material Darker Colorscheme
-- ============================================================================

return {
   -- {
    --     -- Plugin local: Material Darker theme
    --     "material", -- Asumiendo que es el tema "material-theme" de sainnhe
    --     dir = "~/Code/material/",
    --     lazy = true,     -- Carga el plugin al inicio de Neovim
    --     priority = 1000, -- Asegura que se cargue antes que otros plugins que dependan de resaltados
    --     -- enable = false,
    --     -- Configuración del plugin
    --     config = function()
    --         -- vim.g.material_style = "darker"
    --         require("material").setup({
    --             style = "black",
    --         })
    --         -- vim.cmd("colorscheme material-darker") -- Aplica el esquema de colores 'material'
    --     end,
    --
    --     -- Opcional: Dependencias (si las hay)
    --     -- dependencies = {},
    -- },
{
  "serhez/teide.nvim",
  -- lazy = true,
  priority = 1000,
    config = function ()
        require("teide").setup({
              -- use the dark style
            style = "darker",
  -- disable italic for functions
        })
        vim.cmd([[colorscheme teide-darker]])
    end
}
}
