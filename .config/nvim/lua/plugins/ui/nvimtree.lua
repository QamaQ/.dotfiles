return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")
    local icons = require("config.core").icons
    local deivicon = require("nvim-web-devicons")

    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    --
    -- deivicon.setup({
    --   override = {
    --     py = {
    --       icon = icons.devicons.py,
    --       color = icons.devicons.py.color,
    --       cterm_color = "214",
    --       name = "Py",
    --     },
    --     tex = {
    --       icon = icons.devicons.tex.icon,
    --       color = icons.devicons.tex.color,
    --       cterm_color = "22",
    --       name = "Tex",
    --     },
    --   },
    -- })

    nvimtree.setup({
      filters = {
        dotfiles = false,
      },
      disable_netrw = true,
      hijack_netrw = true,
      hijack_cursor = true,
      hijack_unnamed_buffer_when_opening = false,
      sync_root_with_cwd = true,
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      view = {
        side = "left",
        width = 30,
        preserve_window_proportions = false,
      },
      git = {
        enable = false,
        -- ignore = true,
      },
      filesystem_watchers = {
        enable = true,
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      renderer = {
        root_folder_label = false,
        highlight_git = false,
        highlight_opened_files = "none",
        indent_markers = {
          enable = false,
          inline_arrows = false,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          modified_placement = "after",
          padding = " ",

          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "󰈚",
            symlink = "",
            modified = icons.ui.Circle,
            folder = {
              default = icons.ui.Folder,
              empty = icons.ui.Empty,
              empty_open = icons.ui.EmptyOpen,
              open = icons.ui.FolderOpen,
              symlink = "",
              symlink_open = "",
              arrow_open = icons.ui.ArrowOpen,
              arrow_closed = icons.ui.ArrowClosed,
            },
          },
        },
      },
    })
  end,
}
