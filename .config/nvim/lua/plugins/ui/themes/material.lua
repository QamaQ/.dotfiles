return {
  'marko-cerovac/material.nvim',
  config = function()
    local material = require("material")
    vim.g.material_style = "darker"

    local colors = require("material.colors")
    material.setup({
      contrast = {
        terminal = true,
      },
      styles = {
        comments = { italic = true }
      },
      plugins = {
        "dashboard",
        "eyeliner",
        "fidget",
        "flash",
        "gitsigns",
        "harpoon",
        "hop",
        "illuminate",
        "indent-blankline",
        "lspsaga",
        "mini",
        "neogit",
        "neotest",
        "neo-tree",
        "neorg",
        "noice",
        "nvim-cmp",
        "nvim-navic",
        "nvim-tree",
        "nvim-web-devicons",
        "rainbow-delimiters",
        "sneak",
        "telescope",
        "trouble",
        "which-key",
      },
      custom_colors = function(colors)
        colors.editor.fg = "#EEFFFF"
      end,
      custom_highlights = {
        --PmenuSel = { bg = colors.syntax.  fg = "NONE" },
        Pmenu = { bg = colors.editor.bg },
      },
      high_visibility = {
        lighter = false, -- Enable higher contrast text for lighter style
        darker = true -- Enable higher contrast text for darker style
      },

      lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
    })

    vim.cmd 'colorscheme material'
  end
}
