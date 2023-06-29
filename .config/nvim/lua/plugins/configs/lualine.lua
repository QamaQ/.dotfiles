return {
"nvim-lualine/lualine.nvim",
        event = { "VeryLazy" },
        config = function()
local M = {}
local lualine = require("lualine")
local colors = require("material.colors")
local icon = require("core.icons")
local icons = icon.icons

local mode_color = {
    -- normal
    n = colors.main.blue,
    no = colors.main.blue,
    -- insert
    i = colors.main.green,
    -- visual
    v = colors.main.purple,
    [""] = colors.main.purple,
    V = colors.main.purple,
    -- select
    s = colors.main.orange,
    S = colors.main.orange,
    [""] = colors.main.orange,
    -- replace
    R = colors.main.red,
    Rv = colors.main.red,
    -- command
    c = colors.main.yellow,
    cv = colors.main.yellow,
    ce = colors.main.yellow,
    ["!"] = colors.main.yellow,
    -- other
    ic = colors.main.cyan,
    r = colors.main.cyan,
    rm = colors.main.cyan,
    ["r?"] = colors.main.cyan,
    t = colors.main.cyan,
}
local icon_colors = {
    Brown = "#905532",
    Aqua = "#3AFFDB",
    Blue = "#689FB6",
    Darkblue = "#44788E",
    Purple = "#834F79",
    Red = "#AE403F",
    Beige = "#F5C06F",
    Yellow = "#F09F17",
    Orange = "#D4843E",
    Darkorange = "#F16529",
    Pink = "#CB6F6F",
    Salmon = "#EE6E73",
    Green = "#8FAA54",
    Lightgreen = "#31B53E",
    White = "#FFFFFF",
    LightBlue = "#5fd7ff",
}

local mode_icon = {
    -- normal
    n = icons.lualine.status_left,
    no = icons.lualine.status_left,
    -- insert
    i = icons.lualine.change,
    -- visual
    v = icons.lualine.select,
    [""] = icons.lualine.select,
    V = icons.lualine.select,
    -- select
    s = icons.lualine.select,
    S = icons.lualine.select,
    [""] = icons.lualine.select,
    -- replace
    R = icons.lualine.replace,
    Rv = icons.lualine.replace,
    -- command
    c = icons.lualine.terminal,
    cv = icons.lualine.terminal,
    ce = icons.lualine.terminal,
    ["!"] = icons.lualine.terminal,
    -- other
    ic = icons.lualine.status_left,
    r = icons.lualine.status_left,
    rm = icons.lualine.status_left,
    ["r?"] = icons.lualine.status_left,
    t = icons.lualine.status_left,
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath .. ";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- check if value in table
local function contains(t, value)
    for _, v in pairs(t) do
        if v == value then
            return true
        end
    end
    return false
end

local lanuage_server = {
    function()
        local buf_ft = vim.bo.filetype
        local ui_filetypes = {
            "help",
            "packer",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "lir",
            "Outline",
            "spectre_panel",
            "toggleterm",
            "DressingSelect",
            "TelescopePrompt",
            "lspinfo",
            "lsp-installer",
            "",
        }

        if contains(ui_filetypes, buf_ft) then
            if M.language_servers == nil then
                return ""
            else
                return M.language_servers
            end
        end

        local clients = vim.lsp.buf_get_clients()
        -- local clients = vim.lsp.get_active_clients()
        local client_names = {}
        local copilot_active = false

        -- add client
        for _, client in pairs(clients) do
            if client.name ~= "copilot" and client.name ~= "null-ls" then
                table.insert(client_names, client.name)
            end
            if client.name == "copilot" then
                copilot_active = true
            end
        end

        -- add formatter
        local s = require("null-ls.sources")
        local available_sources = s.get_available(buf_ft)
        local registered = {}
        for _, source in ipairs(available_sources) do
            for method in pairs(source.methods) do
                registered[method] = registered[method] or {}
                table.insert(registered[method], source.name)
            end
        end

        local formatter = registered["NULL_LS_FORMATTING"]
        local linter = registered["NULL_LS_DIAGNOSTICS"]
        if formatter ~= nil then
            vim.list_extend(client_names, formatter)
        end
        if linter ~= nil then
            vim.list_extend(client_names, linter)
        end

        -- join client names with commas
        local client_names_str = table.concat(client_names, ", ")
        -- local client_names_str = table.pack(client_names, ", ")

        -- check client_names_str if empty
        local language_servers = ""
        local client_names_str_len = #client_names_str
        if client_names_str_len ~= 0 then
            -- language_servers = hl_str("", "SLSep") .. hl_str(client_names_str, "SLSeparator") .. hl_str("", "SLSep")
            language_servers = icons.lualine.lsp_icon .. " LSP ~ " .. client_names_str .. ""
        end
        -- if copilot_active then
        --     language_servers = language_servers .. "%#SLCopilot#" .. " " .. icons.icons.neotree.git.unmerged .. "%*"
        -- end

        if client_names_str_len == 0 and not copilot_active then
            return ""
        else
            M.language_servers = language_servers
            return language_servers:gsub(", anonymous source", "")
        end
    end,
    padding = { left = 1, right = 1 },
    color = { fg = colors.syntax.comments, gui = "italic" },
    -- cond = hide_in_width,
    -- separator = "%#SLSeparator#" .. " │" .. "%*",
}
-- lualine.setup {
local config = {
    options = {
        globalstatus = true,
        icons_enabled = true,
        theme = "auto",
        -- theme = theme,
        -- section_separators = { left = "", right = "" },
        always_divide_middle = true,
        -- Disable sections and component separators
        component_separators = "",
        disabled_filetypes = {
            statusline = {
                "dashboard",
                "alpha",
                "neo-tree",
                "lazy",
                "mason",
            },
        },
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        -- lualine_c = {},
        lualine_c = {},
        -- lualine_x = { diff, spaces, "encoding", filetype },
        -- lualine_x = { diff, lanuage_server, spaces, filetype },
        -- lualine_x = { lanuage_server, spaces, filetype },
        lualine_x = { lanuage_server },
        lualine_y = {},
        lualine_z = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    extensions = {},
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end
local function ins_right_y(component)
    table.insert(config.sections.lualine_y, component)
end
ins_left({
    function()
        return icons.lualine.left_bar
    end,
    color = function()
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { left = 0, right = 0 },
})

ins_left({
    -- mode component
    function()
        return mode_icon[vim.fn.mode()]
    end,
    color = function()
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { left = 0, right = 1 },
})
ins_left({
    "branch",
    icon = icons.lualine.branch,
    color = { fg = colors.main.purple, gui = "bold" },
    padding = { left = 1, right = 1 },
})

-- ins_left({
--     "filetype",
--     fmt = function(str)
--         local ui_filetypes = {
--             "help",
--             "packer",
--             "neogitstatus",
--             "NvimTree",
--             "Trouble",
--             "lir",
--             "Outline",
--             "spectre_panel",
--             "toggleterm",
--             "DressingSelect",
--             "",
--             "nil",
--         }
--
--         local return_val = function(str)
--             return str
--         end
--
--         if str == "TelescopePrompt" then
--             return return_val(icon.ui.Telescope)
--         end
--
--         local function get_term_num()
--             local t_status_ok, toggle_num = pcall(vim.api.nvim_buf_get_var, 0, "toggle_number")
--             if not t_status_ok then
--                 return ""
--             end
--             return toggle_num
--         end
--
--         if str == "toggleterm" then
--             -- 
--             local term = "%#SLTermIcon#" .. " " .. "%*" .. "%#SLFT#" .. get_term_num() .. "%*"
--
--             return return_val(term)
--         end
--
--         if contains(ui_filetypes, str) then
--             return ""
--         else
--             return return_val(str)
--         end
--     end,
--     icon_only = true,
--     icons_enabled = true,
--     padding = { left = 1, right = 1 },
-- })

local user_icons = {}

local function get_file_info()
    return vim.fn.expand("%:t"), vim.fn.expand("%:e")
end

function M.define_file_icon()
    return user_icons
end

ins_left({
    "filetype",
    -- fmt = function()
    --     function M.get_file_icon()
    --         local icon, icon_highlight_group
    --         local ok, devicons = pcall(require, "nvim-web-devicons")
    --         if ok then
    --             icon, icon_highlight_group = devicons.get_icon(vim.fn.expand("%:t"))
    --             if icon == nil then
    --                 icon, icon_highlight_group = devicons.get_icon_by_filetype(vim.bo.filetype)
    --             end
    --         end
    --
    --         local f_name, f_extension = get_file_info()
    --         if user_icons[vim.bo.filetype] ~= nil then
    --             icon = user_icons[vim.bo.filetype][2]
    --         elseif user_icons[f_extension] ~= nil then
    --             icon = user_icons[f_extension][2]
    --         end
    --         if icon == nil then
    --             if ok then
    --                 icon = devicons.get_icon(f_name, f_extension, { default = true })
    --             elseif vim.fn.exists("*WebDevIconsGetFileTypeSymbol") == 1 then
    --                 icon = vim.fn.WebDevIconsGetFileTypeSymbol()
    --             end
    --         end
    --         if icon == nil then
    --             icon = ""
    --         end
    --         return icon .. " "
    --     end
    --
    --     return M.get_file_icon()
    -- end,
    colored = true,
    icon_only = true,
    icons_enabled = true,
    -- icon = { "x", align = "right" },
    padding = { left = 1, right = 1 },
})

ins_left({
    "filename",
    path = 0,
    symbols = { modified = icon.ui.Circle, readonly = "", unnamed = "" },
    color = { fg = colors.syntax.comments, gui = "italic" },
    padding = { left = 0, right = 2 },
})

ins_left({
    "diff",
    symbols = {
        added = icons.lualine.add,
        modified = icons.lualine.change,
        removed = icons.lualine.delete,
    },
    cond = conditions.hide_in_width,
    padding = { left = 2, right = 2 },
})

-- right side
ins_right({})

-- diagnostics
ins_right({
    "diagnostics",
    sources = { "nvim_diagnostic" },
    padding = { left = 2, right = 2 },
})

-- os logo
ins_right_y({
    function()
        return icon.ui.Atom
    end,
    color = function()
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { left = 1, right = 0 },
})

-- right bar; color change with vim mode
ins_right_y({
    function()
        return icons.lualine.right_bar
    end,
    color = function()
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { left = 1, right = 0 },
})

lualine.setup(config)
        end,
}
