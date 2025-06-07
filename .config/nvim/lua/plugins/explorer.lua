local icons = require("core.icons")
local M = {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        default_icon   = { icon = "󰈚", name = "Default" },
        js             = { icon = "󰌞", name = "js" },
        ts             = { icon = "󰛦", name = "ts" },
        lock           = { icon = "󰌾", name = "lock" },
        ["robots.txt"] = { icon = "󰚩", name = "robots" },
        py             = { icon = "", name = "py", color = "#0288D1" },
        lua            = { icon = "", name = "lua", color = "#42a5f5" },
        json           = { icon = "", name = "json", color = "#f9a825" },
        markdown       = { icon = "󰽛", name = "Markdown", color = "#42a5f5" },
        ["readme.md"]  = { icon = "󰽛", color = "#42a5f5", cterm_color = "253", name = "Markdown" },
        ["readme"]     = { icon = "󰽛", color = "#42a5f5", cterm_color = "255", name = "Readme" },
      }
    }
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- optionally enable 24-bit colour
    vim.opt.termguicolors = true


    -- OR setup with some options
    require("nvim-tree").setup({
      filters = { dotfiles = false },
      disable_netrw = true,
      hijack_cursor = true,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        side = "right", -- or left
        width = 30,
        preserve_window_proportions = false,
        float = { enable = true },
      },
      modified = { enable = true },
      renderer = {
        root_folder_label = false,
        highlight_git = true,
        indent_markers = { enable = false, inline_arrows = false },
        icons = {
          glyphs = {
            default = "󰈚",
            modified = icons.misc.circule,
            folder = {
              arrow_closed = " ",
              arrow_open = " ",
              default = "󰉋",
              empty = "󰉖",
              empty_open = "󰷏",
              open = "󰝰",
              symlink = "󰉒",
            },
            git = {
              unstaged = "",
              staged = "",
              unmerged = "",
              renamed = "",
              untracked = "",
              deleted = "",
              ignored = "",
            },
            -- git = {
            --   unmerged = ""
            -- },
          },
        },
      },
    })
  end,
}

return M
