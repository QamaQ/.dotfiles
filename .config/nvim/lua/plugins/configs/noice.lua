return {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            {
                "rcarriga/nvim-notify",
                opts = {
                    timeout = 300,
                    max_height = function()
                        return math.floor(vim.o.lines * 0.75)
                    end,
                    max_width = function()
                        return math.floor(vim.o.columns * 0.75)
                    end,
                },
            },
        },
        config = function()
local status_ok, noice = pcall(require, "noice")
if not status_ok then
    return
end

local icon = require("core.icons")

noice.setup({
    views = {
        popupmenu = {
            win_options = {
                winhighlight = { normal = "Normal", FloatBorder = "DiagnosticInfo" }
            }
        },
        cmdline_popup = {
            backend = "popup",
            border = {
                style = { "╭", "─", "╮", "│", "╯", "─", "╰",  "│" },
                padding = { 0, 2 }
            },
            win_options = {
                winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            }
        }
    },
    cmdline = {
        enabled = true,         -- enables the Noice cmdline UI
        view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
        opts = {},              -- global options for the cmdline. See section on views
        format = {
            cmdline = { pattern = "^:", icon = icon.ui.Term, lang = "vim" },
            search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
            search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
            filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
            lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
            help = { pattern = "^:%s*he?l?p?%s+", icon = icon.ui.Help },
            input = {}, -- Used by input()
        },
    },
    lsp = {
        progress = {
            enabled = true,
            -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
            -- See the section on formatting for more details on how to customize.
            --- @type NoiceFormat|string
            format = "lsp_progress",
            --- @type NoiceFormat|string
            format_done = "lsp_progress_done",
            throttle = 1000 / 30, -- frequency to update lsp progress message
            view = "mini",
        },
        override = {
            -- override the default lsp markdown formatter with Noice
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            -- override the lsp markdown formatter with Noice
            ["vim.lsp.util.stylize_markdown"] = true,
            -- override cmp documentation with Noice (needs the other options to work)
            ["cmp.entry.get_documentation"] = true,
        },
        hover = { enabled = false },
        signature = { enabled = false },
    },
    routes = {
        {
            filter = {
                event = "msg_show",
                kind = "search_count",
                find = "written"
                -- any = {
                --   { find = "%d+L, %d+B" },
                --   { find = "; after #%d+" },
                --   { find = "; before #%d+" },
                -- },
            },
            opts = { skip = true },
            -- view = "mini",
        },
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
    },

})
        end,
}
