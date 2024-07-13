return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local nvimtree = require("nvim-tree")
    local icons = require("plugins.core").opts.icons
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
          inline_arrows = true,
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
            modified = icons.misc.Circle,
            folder = {
              default = icons.misc.Folder,
              empty = icons.misc.Empty,
              empty_open = icons.misc.EmptyOpen,
              open = icons.misc.FolderOpen,
              symlink = "",
              symlink_open = "",
              arrow_open = icons.misc.ArrowOpen,
              arrow_closed = icons.misc.ArrowClosed,
            },
          },
        },
      },
    })

    -- # auto close NvimTree 
    vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
        if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
          vim.cmd "quit"
        end
      end
    })




    local wk = require("which-key")
    wk.register{
      ["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", "Explorador de archivos" }
    }
  end,
}
