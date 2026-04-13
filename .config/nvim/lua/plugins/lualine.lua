local icons = require("core.icons")

local M = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
        -- "AndreM222/copilot-lualine",
    },
    lazy = false,
    cond = not vim.g.started_by_firenvim and not vim.g.vscode and not vim.g.slow_network,
}

vim.g.lualine_show_filetype = false


local mini_files_extension = {
    sections = {
        lualine_a = {
            function()
                local ok, mini_files = pcall(require, "mini.files")
                if ok then
                    local entry = mini_files.get_fs_entry()
                    local path = vim.fn.fnamemodify(entry.path, ":.")
                    -- Remove the last element (the filename, after the last "/")
                    path = path:match("(.+)/[^/]+$") or path
                    return path
                else
                    return ""
                end
            end,
        },
    },
    filetypes = { "minifiles" },
}

local function open_explorer()
    local minifiles_present, _ = pcall(require, "mini.files")
    local oil_present, _ = pcall(require, "oil")
    if minifiles_present then
        vim.cmd("MiniFiles")
    elseif oil_present then
        vim.cmd("OilSmart")
    end
end

local function pinned_provider()
    return icons.pin_location
end

function M.toggle_filetype()
    vim.g.lualine_show_filetype = not vim.g.lualine_show_filetype
end

local function venv_provider()
    if vim.g.active_venv == nil or vim.g.active_venv == "" or vim.g.active_venv == "base" then
        return ""
    end

    return icons.tool.venv .. " " .. vim.g.active_venv
end

local function diff_source()
    local gitsigns = vim.b.gitsigns_status_dict
    if gitsigns then
        return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
        }
    end
end

function M.config()
    local hls = require("core.hls")
    local colors = hls.colors()
    local folders_component = require("lualine.components.filename"):extend()
    local filename_component = require("lualine.components.filename"):extend()

    local git_branches_fn = function() end
    local snacks_present, snacks = pcall(require, "snacks")
    if snacks_present then
        git_branches_fn = function(_, _, _)
            snacks.picker.git_branches()
        end
    else
        local fzf_present, fzf = pcall(require, "fzf-lua")
        if fzf_present then
            git_branches_fn = function(_, _, _)
                fzf.git_branches()
            end
        end
    end

    function folders_component:init(options)
        folders_component.super.init(self, options)

        -- Register highlight groups
        vim.api.nvim_set_hl(0, "LualineFoldersSaved", {
            link = "lualine_c_inactive",
        })
        vim.api.nvim_set_hl(0, "LualineFoldersModified", {
            -- link = "DiagnosticVirtualTextWarn",
            link = "lualine_c_inactive",
        })

        if self.options.color == nil then
            self.options.color = ""
        end
    end

    function folders_component:update_status()
        local data = folders_component.super.update_status(self)

        -- Remove leading slashes
        data = data:gsub("^/+", "")

        -- If the path is empty or has no slashes (i.e., just the filename), return an empty string
        if data == "" or not data:find("/") then
            return ""
        end

        -- Terminals
        if data:find("term://") then
            return "Terminal: "
        end

        -- mini.files
        if data:find("minifiles://") then
            return "File explorer: "
        end

        -- oil
        if data:find("ssh://") then
            return "Remote: "
        end

        -- Remove the last element (the filename, after the last "/")
        data = data:match("(.+)/[^/]+$") or data

        -- Use custom separators
        data = data:gsub("/", " " .. icons.arrow.right_tall .. " " .. icons.folder.default .. " ")

        -- Include padding icons
        data = icons.folder.default .. " " .. data .. " " .. icons.arrow.right_tall

        -- Adapt highlights
        data = "%#" .. (vim.bo.modified and "LualineFoldersModified" or "LualineFoldersSaved") .. "#" .. data

        return data
    end

    function filename_component:init(options)
        filename_component.super.init(self, options)

        -- Register highlight groups
        vim.api.nvim_set_hl(0, "LualineFileNameSaved", {
            fg = hls.fromhl("StatusLine").fg,
            bg = hls.fromhl("StatusLine").bg,
            bold = true,
        })
        vim.api.nvim_set_hl(0, "LualineFileNameModified", {
            fg = hls.fromhl("DiagnosticVirtualTextWarn").fg,
            bg = hls.fromhl("DiagnosticVirtualTextWarn").bg,
            -- fg = hls.fromhl("DiagnosticWarn").fg,
            bold = true,
        })

        if self.options.color == nil then
            self.options.color = ""
        end
    end

    function filename_component:update_status()
        local data = filename_component.super.update_status(self)
        data = "%#" .. (vim.bo.modified and "LualineFileNameModified" or "LualineFileNameSaved") .. "#" .. data

        return data
    end

    local custom_ftype = require("lualine.components.filetype"):extend()
    function custom_ftype:init(options)
        custom_ftype.super.init(self, options)

        -- Register highlight groups
        vim.api.nvim_set_hl(0, "LualineFileTypeSaved", {
            link = "StatusLine",
        })
        vim.api.nvim_set_hl(0, "LualineFileTypeModified", {
            -- link = "DiagnosticVirtualTextWarn",
            link = "StatusLine",
        })

        if self.options.color == nil then
            self.options.color = ""
        end
    end

    require("lualine").setup({
        options = {
            icons_enabled = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {
                    "dap-repl",
                    "dapui_scopes",
                    "dapui_stacks",
                    "dapui_watches",
                    "dapui_repl",
                    "LspTrouble",
                    "qf",
                    -- "NvimTree",
                    "vista_kind",
                    "dashboard",
                    "startify",
                },
                winbar = { "*" },
            },
            ignore_focus = {},
            always_divide_middle = true,
            globalstatus = true,
            refresh = {
                statusline = 100,
                tabline = 100,
                winbar = 100,
            },
        },
        sections = {
            lualine_a = {
                {
                    "branch",
                    icon = icons.git.branch,
                    on_click = git_branches_fn,
                }
            },
            lualine_b = {
                {
                    "diff",
                    source = diff_source(),
                    symbols = {
                        added = " " .. icons.git.added .. " ",
                        modified = " " .. icons.git.changed .. " ",
                        removed = " " .. icons.git.removed .. " ",
                    },
                    on_click = function(_, _, _)
                        vim.cmd("CodeDiff")
                    end,
                },
                {
                    venv_provider,
                    cond = function()
                        local cond = vim.g.active_venv ~= nil
                            and vim.g.active_venv ~= ""
                            and vim.g.active_venv ~= "base"
                        return cond
                    end,
                    on_click = function(_, _, _)
                        vim.cmd("lua require('swenv.api').pick_venv()")
                    end,
                },

            },
            lualine_c = {

                {
                    folders_component,
                    file_status = true,
                    newfile_status = true,
                    -- 0: Just the filename
                    -- 1: Relative path
                    -- 2: Absolute path
                    -- 3: Absolute path, with tilde as the home directory
                    -- 4: Filename and parent dir, with tilde as the home directory
                    path = 1,
                    padding = { left = 1, right = 0 },
                    shorting_target = 75,
                    symbols = {
                        modified = icons.small_circle,
                        readonly = icons.lock,
                        unnamed = "[No name]",
                        newfile = "[New]",
                    },
                    on_click = open_explorer,
                },
                {
                    custom_ftype,
                    icon_only = true,
                    separator = "",
                    padding = { left = 1, right = 0 },
                    on_click = open_explorer,
                },
                {
                    filename_component,
                    file_status = false,
                    newfile_status = false,
                    -- 0: Just the filename
                    -- 1: Relative path
                    -- 2: Absolute path
                    -- 3: Absolute path, with tilde as the home directory
                    -- 4: Filename and parent dir, with tilde as the home directory
                    path = 0,
                    padding = { left = 0, right = 1 },
                    shorting_target = 125,
                    color = { bold = true },
                    symbols = {
                        modified = icons.small_circle,
                        readonly = icons.lock,
                        unnamed = "[No name]",
                        newfile = "[New]",
                    },
                    on_click = open_explorer,
                },
            },
            lualine_x = {},
            lualine_y = {
                {
                    "diagnostics",
                    -- sources = { "nvim_lsp" },
                    sections = { "error", "warn", "info", "hint" },
                    diagnostics_color = {
                        error = "DiagnosticVirtualTextError",
                        warn = "DiagnosticVirtualTextWarn",
                        info = "DiagnosticVirtualTextInfo",
                        hint = "DiagnosticVirtualTextHint",
                    },
                    symbols = {
                        error = icons.diagnostics.error .. " ",
                        warn = icons.diagnostics.warning .. " ",
                        info = icons.diagnostics.info .. " ",
                        hint = icons.diagnostics.hint .. " ",
                    },
                    colored = true,
                    update_in_insert = true,
                    -- always_visible = false,
                    -- on_click = function(_, _, _)
                    -- 	vim.cmd("Trouble diagnostics toggle filter.buf=0")
                    -- end,
                },
                {
                    'lsp_status',
                    icon = '', -- f013
                    symbols = {
                        -- Standard unicode symbols to cycle through for LSP progress:
                        spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                        -- Standard unicode symbol for when LSP is done:
                        done = '✓',
                        -- Delimiter inserted between LSP names:
                        separator = ' ',
                    },
                    -- List of LSP names to ignore (e.g., `null-ls`):
                    ignore_lsp = {},
                    -- Display the LSP name
                    show_name = true,
                },
                {
                    "filetype",
                    icon = { "" },
                    cond = function()
                        return vim.g.lualine_show_filetype
                    end,
                },
            },
            lualine_z = {
                {
                    "location",
                },
                {
                    "progress",
                },
                -- {
                -- 	"tabs",
                -- 	-- use_mode_colors = true,
                -- 	-- show_modified_status = false,
                -- 	-- mode = 1,
                -- 	fmt = function(_, context)
                -- 		if context.current then
                -- 			return icons.circle
                -- 		end
                -- 		return icons.empty_circle
                -- 	end,
                -- },
            }
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {
            -- "avante",  -- loads avante at startup, which is a significant overhead
            "lazy",
            "mason",
            "neo-tree",
            "nvim-dap-ui",
            "oil",
            "quickfix",
            "symbols-outline",
            "toggleterm",
            "trouble",
            mini_files_extension,
        },
    })
end

return M
