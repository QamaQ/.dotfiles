return {
  "nvim-neo-tree/neo-tree.nvim",
  deactivate = function()
    vim.cmd [[Neotree close]]
  end,
  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == "directory" then
        require "neo-tree"
      end
    end
  end,
  config = function()
    local ok, neotree, inputs = pcall(function()
      return require "neo-tree", require "neo-tree.ui.inputs"
    end)
    if not ok then
      return
    end

    local icons = require "core.icons"

    neotree.setup {
      close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
      popup_border_style = "rounded",
      use_popups_for_input = false,
      enable_git_status = true,
      enable_diagnostics = false,
      use_default_mappings = true,
      default_component_configs = {
        indent = {
          indent_size = 2,
          padding = 1, -- extra padding on left hand side
          -- indent guides
          with_markers = true,
          indent_marker = "│",
          last_indent_marker = "└",
          highlight = "NeoTreeIndentMarker",
          -- expander config, needed for nesting files
          with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = icons.ui.ArrowClosed,
          expander_expanded = icons.ui.ArrowOpen,
          expander_highlight = "NeoTreeExpander",
        },
        icon = {
          folder_closed = icons.ui.Folder,
          folder_open = icons.ui.FolderOpen,
          folder_empty = icons.ui.Empty,
          default = icons.neotree.default,
        },
        modified = {
          symbol = icons.ui.Circle,
          highlight = "NeoTreeModified",
        },
        name = {
          trailing_slash = true,
          use_git_status_colors = true,
        },
        git_status = {
          symbols = {
            -- Change type
            added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = icons.ui.Circle, -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = "✖", -- this can only be used in the git_status source
            renamed = "", -- this can only be used in the git_status source
            -- Status type
            untracked = "?",
            ignored = "",
            unstaged = "M",
            staged = "",
            conflict = "",
          },
        },
      },
      window = {
        position = "left",
        width = 30,
        mappings = {
          ["<CR>"] = "open",
          ["o"] = "open_with_window_picker",
          ["<C-v>"] = "vsplit_with_window_picker",
          ["<C-x>"] = "split_with_window_picker",
          ["t"] = "open_tabnew",
          ["T"] = "open_tabnew",
          ["X"] = "close_node",
          ["K"] = "navigate_up",
          ["C"] = "set_root",
          ["H"] = "toggle_hidden",
          ["r"] = "refresh",
          ["f"] = "filter_on_submit",
          ["<c-f>"] = "clear_filter",
          ["ma"] = "add",
          ["md"] = "delete",
          ["mr"] = "rename",
          ["mm"] = "move",
          ["c"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["q"] = "close_window",
          ["]c"] = "next_git_modified",
          ["[c"] = "prev_git_modified",
          ["g?"] = "show_help",
          ["<Tab>"] = { "toggle_preview", config = { use_float = false } },
        },
        mapping_options = {
          nowait = true,
        },
      },
      nesting_rules = {},
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = true,
          hide_gitignored = true,
          hide_by_name = {
            ".DS_Store",
            "thumbs.db",
          },
          never_show = { -- remains hidden even if visible is toggled to true
          },
        },
        follow_current_file = true, -- This will find and focus the file in the active buffer every
        -- time the current file is changed while the tree is open.
        hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
        -- in whatever position is specified in window.position
        -- "open_current",  -- netrw disabled, opening a directory opens within the
        -- window like netrw would, regardless of window.position
        -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
        -- use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
        -- instead of relying on nvim autocmd events.
      },
      buffers = {
        show_unloaded = true,
        window = {
          mappings = {
            ["bd"] = "buffer_delete",
          },
        },
      },
    }

    vim.api.nvim_create_autocmd("TermClose", {
      pattern = "*lazygit",
      callback = function()
        if package.loaded["neo-tree.sources.git_status"] then
          require("neo-tree.sources.git_status").refresh()
        end
      end,
    })
    --
    -- inputs.confirm = function(message, callback)
    --     callback(vim.fn.confirm(message, "&Yes\n&No") == 1)
    -- end

    -- vim.keymap.set("n", "<leader>a", "<cmd>Neotree reveal left<cr>")
    -- vim.keymap.set("n", "<C-n>", "<cmd>Neotree toggle left<cr>")
  end,
}
