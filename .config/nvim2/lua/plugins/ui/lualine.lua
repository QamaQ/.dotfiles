local icons = require("core.icons")

local M = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    cond = not vim.g.started_by_firenvim and not vim.g.vscode and not vim.g.slow_network,
}

vim.g.lualine_show_filetype = false

local function open_explorer()
    vim.cmd("NvimTreeToggle")
end

function M.toggle_filetype()
    vim.g.lualine_show_filetype = not vim.g.lualine_show_filetype
end

local function detect_venv()
    local venv = vim.fn.getenv("VIRTUAL_ENV")
        or vim.fn.getenv("CONDA_DEFAULT_ENV")
        or vim.fn.getenv("POETRY_ACTIVE")
    if venv and venv ~= vim.NIL then
        return vim.fn.fnamemodify(venv, ":t")
    end
    return nil
end

vim.g.active_venv = detect_venv()

local function venv_provider()
    if vim.g.active_venv == nil or vim.g.active_venv == "" or vim.g.active_venv == "base" then
        return ""
    end
    return icons.tool.venv .. " " .. vim.g.active_venv
end

local function pick_venv_and_restart()
    local venv_paths = {}
    local scan = vim.fn.stdpath("data") .. "/../.venv"
    local home_venvs = vim.fn.expand("~/.virtualenvs/*")
    local local_venvs = vim.fn.expand("./.venv")

    for _, p in ipairs(vim.split(home_venvs, "\n")) do
        if p ~= "" then table.insert(venv_paths, p) end
    end
    if vim.fn.isdirectory(local_venvs) == 1 then
        table.insert(venv_paths, local_venvs)
    end

    if #venv_paths == 0 then
        local dirs = vim.fn.expand(vim.fn.getenv("HOME") .. "/.local/share/virtualenvs/*")
        for _, p in ipairs(vim.split(dirs, "\n")) do
            if p ~= "" then table.insert(venv_paths, p) end
        end
    end

    local items = {}
    for _, p in ipairs(venv_paths) do
        table.insert(items, { name = vim.fn.fnamemodify(p, ":t"), path = p })
    end
    if #items == 0 then
        vim.notify("No virtual environments found", vim.log.levels.WARN)
        return
    end

    vim.ui.select(items, {
        prompt = "Select python venv",
        format_item = function(item)
            return item.name .. " (" .. item.path .. ")"
        end,
    }, function(choice)
        if not choice then return end
        local bin_dir = choice.path .. "/bin/python"
        if vim.fn.executable(bin_dir) == 0 then
            bin_dir = choice.path .. "/Scripts/python.exe"
        end
        vim.fn.setenv("VIRTUAL_ENV", choice.path)
        vim.g.active_venv = choice.name
        require("core.lsp").restart_python_servers()
    end)
end

local function pinned_provider()
    return icons.pin_location
end

local function pinned_condition()
    return false
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

local function lightbulb_provider()
    return ""
end

local function copilot_cond()
    return vim.g.copilot_loaded ~= nil and vim.g.copilot_loaded and vim.g.copilot_loaded ~= false
end

local function pick_venv_and_restart()
    local ok, swenv = pcall(require, "swenv.api")
    if not ok then return end

    local venvs = swenv.get_venvs()
    vim.ui.select(venvs, {
        prompt = "Select python venv",
        format_item = function(item)
            return string.format("%s (%s)", item.name, item.path)
        end,
    }, function(choice)
        if not choice then return end
        swenv.set_venv_path(choice)
        require("core.lsp").restart_python_servers()
    end)
end

local function lsp_name()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then return "" end
    local names = {}
    for _, client in ipairs(clients) do
        table.insert(names, client.name)
    end
    return " " .. table.concat(names, ", ")
end

function M.init()
    require("core.keymaps").register({
        "<leader>kf",
        "<cmd>lua require('plugins.ui.lualine').toggle_filetype()<cr>",
        desc = "Toggle filetype",
    })
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
    end

    function folders_component:init(options)
        folders_component.super.init(self, options)

        vim.api.nvim_set_hl(0, "LualineFoldersSaved", {
            link = "lualine_c_inactive",
        })
        vim.api.nvim_set_hl(0, "LualineFoldersModified", {
            link = "lualine_c_inactive",
        })

        if self.options.color == nil then
            self.options.color = ""
        end
    end

    function folders_component:update_status()
        local data = folders_component.super.update_status(self)

        data = data:gsub("^/+", "")

        if data == "" or not data:find("/") then
            return ""
        end

        if data:find("term://") then
            return "Terminal: "
        end

        data = data:match("(.+)/[^/]+$") or data

        data = data:gsub("/", " " .. icons.arrow.right_tall .. " " .. icons.folder.default .. " ")

        data = icons.folder.default .. " " .. data .. " " .. icons.arrow.right_tall

        data = "%#" .. (vim.bo.modified and "LualineFoldersModified" or "LualineFoldersSaved") .. "#" .. data

        return data
    end

    function filename_component:init(options)
        filename_component.super.init(self, options)

        vim.api.nvim_set_hl(0, "LualineFileNameSaved", {
            fg = hls.fromhl("StatusLine").fg,
            bg = hls.fromhl("StatusLine").bg,
            bold = true,
        })
        vim.api.nvim_set_hl(0, "LualineFileNameModified", {
            fg = hls.fromhl("DiagnosticWarn").fg,
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

        vim.api.nvim_set_hl(0, "LualineFileTypeSaved", {
            link = "StatusLine",
        })
        vim.api.nvim_set_hl(0, "LualineFileTypeModified", {
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
            section_separators = { left = " ", right = " " },
            disabled_filetypes = {
                statusline = {
                    "dap-repl",
                    "dapui_scopes",
                    "dapui_stacks",
                    "dapui_watches",
                    "dapui_repl",
                    "LspTrouble",
                    "qf",
                    "NvimTree",
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
                    "mode",
                    fmt = function(str) return "|" end,
                    padding = { left = 0, right = 1 },
                },
                {
                    venv_provider,
                    padding = { left = 1, right = 1 },
                    cond = function()
                        return vim.g.active_venv ~= nil
                            and vim.g.active_venv ~= ""
                            and vim.g.active_venv ~= "base"
                    end,
                    on_click = pick_venv_and_restart,
                },
                {
                    "branch",
                    icon = icons.git.branch,
                    padding = { left = 1, right = 1 },
                    on_click = git_branches_fn,
                },
            },
            lualine_b = {
                {
                    "diff",
                    colored = true,
                    padding = { left = 1, right = 1 },
                    diff_color = {
                        added = "DiffAdded",
                        modified = "DiffChanged",
                        removed = "DiffRemoved",
                    },
                    symbols = {
                        added = " " .. icons.git.added .. " ",
                        modified = " " .. icons.git.changed .. " ",
                        removed = " " .. icons.git.removed .. " ",
                    },
                    source = diff_source,
                    on_click = function(_, _, _)
                        vim.cmd("CodeDiff")
                    end,
                },
            },
            lualine_c = {
                {
                    pinned_provider,
                    cond = pinned_condition,
                    padding = { left = 0, right = 1 },
                    color = { fg = colors.red },
                    on_click = open_explorer,
                },
                {
                    folders_component,
                    file_status = false,
                    newfile_status = false,
                    path = 1,
                    padding = { left = 0, right = 0 },
                    shorting_target = 75,
                    symbols = {
                        modified = icons.small_circle,
                        readonly = icons.lock,
                        unnamed = " [No name]",
                        newfile = " [New]",
                    },
                    on_click = open_explorer,
                },
                {
                    custom_ftype,
                    icon_only = true,
                    separator = "",
                    padding = { left = 0, right = 0 },
                    on_click = open_explorer,
                },
                {
                    filename_component,
                    file_status = false,
                    newfile_status = false,
                    path = 0,
                    padding = { left = 0, right = 0 },
                    shorting_target = 125,
                    color = { bold = true },
                    symbols = {
                        modified = icons.small_circle,
                        readonly = icons.lock,
                        unnamed = " [No name]",
                        newfile = " [New]",
                    },
                    on_click = open_explorer,
                },
            },
            lualine_x = {},
            lualine_y = {
                {
                    lightbulb_provider,
                    padding = { left = 1, right = 1 },
                    color = "DiagnosticVirtualTextInfo",
                },
                {
                    "diagnostics",
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
                    padding = { left = 1, right = 1 },
                    update_in_insert = false,
                    always_visible = false,
                    on_click = function(_, _, _)
                        vim.cmd("Trouble diagnostics toggle filter.buf=0")
                    end,
                },
                {
                    lsp_name,
                    padding = { left = 1, right = 1 },
                    cond = function()
                        return #vim.lsp.get_clients({ bufnr = 0 }) > 0
                    end,
                },
                {
                    "copilot",
                    show_colors = true,
                    show_loading = true,
                    padding = { left = 1, right = 1 },
                    symbols = {
                        status = {
                            icons = {
                                enabled = icons.copilot.enabled,
                                sleep = icons.copilot.sleep,
                                disabled = icons.copilot.disabled,
                                warning = icons.copilot.warning,
                                unknown = icons.copilot.unknown,
                            },
                        },
                    },
                    cond = copilot_cond,
                },
                {
                    "filetype",
                    icon = { "" },
                    padding = { left = 1, right = 1 },
                    cond = function()
                        return vim.g.lualine_show_filetype
                    end,
                },
            },
            lualine_z = {
                { "location", padding = { left = 1, right = 1 } },
                { "progress", padding = { left = 1, right = 1 } },
            },
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
            "lazy",
            "quickfix",
            "trouble",
        },
    })
end

return M
