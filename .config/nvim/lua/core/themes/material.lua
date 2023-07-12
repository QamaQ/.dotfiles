local M = {}

local hl = vim.api.nvim_set_hl

vim.g.material_style = "darker"
local colors = require "material.colors"
local m = colors.main
local e = colors.editor
local b = colors.backgrounds

require("material").setup {
  contrast = {
    terminal = false, -- Enable contrast for the built-in terminal
    sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
    floating_windows = false, -- Enable contrast for floating windows
    cursor_line = false, -- Enable darker background for the cursor line
    non_current_windows = false, -- Enable contrasted background for non-current windows
    filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
  },

  styles = {
    -- Give comments style such as bold, italic, underline etc.
    comments = { italic = true },
    strings = { --[[ bold = true ]]
    },
    keywords = { --[[ underline = true ]]
    },
    functions = { bold = false, italic = true },
    variables = {},
    operators = {},
    types = {},
  },

  plugins = { -- Uncomment the plugins that you use to highlight them
    -- Available plugins:
    "dap",
    "dashboard",
    "gitsigns",
    -- "hop",
    "indent-blankline",
    -- "lspsaga",
    -- "mini",
    -- "neogit",
    -- "neorg",
    "nvim-cmp",
    "nvim-navic",
    "nvim-tree",
    -- "nvim-web-devicons",
    -- "sneak",
    "telescope",
    "trouble",
    "which-key",
  },

  disable = {
    colored_cursor = false, -- Disable the colored cursor
    borders = false, -- Disable borders between verticaly split windows
    background = false, -- Prevent the theme from setting the background (NeoVim then uses your terminal background)
    term_colors = false, -- Prevent the theme from setting terminal colors
    eob_lines = false, -- Hide the end-of-buffer lines
  },

  high_visibility = {
    lighter = false, -- Enable higher contrast text for lighter style
    darker = true, -- Enable higher contrast text for darker style
  },

  lualine_style = "default", -- Lualine style ( can be 'stealth' or 'default' )

  async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)

  custom_colors = function(colors) -- If you want to everride the default colors, set this to a function
    colors.editor.fg = "#EEFFFF"
  end,

  custom_highlights = { -- Overwrite highlights with your own
    StatusLine = { bg = colors.bg },
    Pmenu = { bg = colors.bg }, -- popup menu
    PmenuSel = { fg = colors.main.cyan, bg = "#191919" }, -- Popup menu: selected item.
    PmenuSbar = { bg = colors.bg },
    PmenuThumb = { bg = colors.syntax.comments },
    WildMenu = { fg = colors.main.cyan, bold = false }, -- current match in 'wildmenu' completion
    FloatBorder = { fg = colors.syntax.comments, bg = "NONE" },
    CursorLine = { bg = "#191919" },

    CmpItemAbbrMatch = { fg = colors.main.cyan, bold = false },

    -- nvim tree
    NvimTreeNormal = { fg = e.fg_dark },
    NvimTreeFolderName = { fg = m.blue },
    NvimTreeFolderIcon = { fg = m.blue },
    NvimTreeEmptyFolderName = { fg = m.gray },
    NvimTreeOpenedFolderName = { fg = m.blue, bold = false },
    NvimTreeIndentMarker = { fg = e.disabled },
    NvimTreeGitDirty = { fg = m.yellow },
    NvimTreeGitNew = { fg = m.yellow },
    NvimTreeGitStaged = { fg = e.fg },
    NvimTreeGitDeleted = { fg = m.red },
    -- NvimTreeOpenedFile = { fg = "#00ff00" },
    NvimTreeImageFile = { fg = m.yellow },
    NvimTreeMarkdownFile = { fg = m.pink },
    NvimTreeExecFile = { link = "NvimTreeGitNew" },
    NvimTreeSpecialFile = { fg = m.purple },
    NvimTreeWinSeparator = { link = "WinSeparator" },
    NvimTreeCursorLine = { bg = b.cursor_line },

    -- Telescope
    TelescopeNormal = { fg = colors.syntax.comments, bg = "NONE" },
    TelescopePromptBorder = { fg = colors.syntax.comments, bg = "NONE" },

    -- ToggleTerm
  },
}

M.lualine_theme = {
  normal = {
    a = { bg = e.bg, gui = "bold" },
    b = { bg = e.bg, gui = "bold" },
    c = { bg = e.bg },
  },

  insert = { a = { bg = e.bg } },
  visual = { a = { bg = e.bg } },
  replace = { a = { bg = e.bg } },

  inactive = {
    a = { bg = e.bg },
    b = { bg = e.bg },
    c = { bg = e.bg },
  },
}

local status_lualine, lualine = pcall(require, "lualine")
if not status_lualine then
  return
end
lualine.setup { options = { theme = M.lualine_theme } }

hl(0, "CodiVirtualText", { guifg = colors.syntax.active })

vim.cmd "colorscheme material"

return M
