return {

    "nvim-tree/nvim-tree.lua",

    config = function()
        local icons = require "core.icons"

        local function my_on_attach(bufnr)
            local api = require "nvim-tree.api"

            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            -- default mappings
            api.config.mappings.default_on_attach(bufnr)

            -- custom mappings
            vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts "Up")
            vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
            vim.keymap.set("n", "a", api.fs.create, opts "Create file")
        end
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- pass to setup along with your other options
        require("nvim-tree").setup {
            ---
            on_attach = my_on_attach,

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
                enable = true,
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
                        git = {
                            unstaged = "✗",
                            staged = "✓",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "★",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
            modified = {
                enable = true,
            },
        }

        vim.api.nvim_create_autocmd("BufEnter", {
            nested = true,
            callback = function()
                if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
                    vim.cmd "quit"
                end
            end,
        })
    end,
}
