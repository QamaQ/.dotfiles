return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {

		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			-- opts = {
			-- 	timeout = 300,
			-- 	max_height = function()
			-- 		return math.floor(vim.o.lines * 0.75)
			-- 	end,
			-- 	max_width = function()
			-- 		return math.floor(vim.o.columns * 0.75)
			-- 	end,
			-- },
		},
	},
	config = function()
		local noice = require("noice")
		local icon = require("core.icons")
		local config = {
			views = {
				popupmenu = {
					win_options = {
						winhighlight = { normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
				cmdline_popup = {
					backend = "popup",
					border = {
						style = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
						padding = { 0, 2 },
					},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
				},
			},
			cmdline = {
				enabled = true, -- enables the Noice cmdline UI
				view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
				opts = {}, -- global options for the cmdline. See section on views
				format = {
					cmdline = { pattern = "^:", icon = icon.ui.Term, lang = "vim" },
					search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
					search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
					filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
					lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
					help = { pattern = "^:%s*he?l?p?%s+", icon = icon.ui.Help },
					IncRename = { title = " Rename " },
					substitute = { pattern = "^:%%?s/", icon = " ", ft = "regex", title = "" },
					input = { icon = " ", lang = "text", view = "cmdline_popup", title = "" },
				},
			},
			lsp = {
				progress = {
					enabled = true,
				},
				override = {
					-- override the default lsp markdown formatter with Noice
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					-- override the lsp markdown formatter with Noice
					["vim.lsp.util.stylize_markdown"] = true,
					-- override cmp documentation with Noice (needs the other options to work)
					["cmp.entry.get_documentation"] = true,
				},
				hover = { enabled = true },
				signature = { enabled = false },
				documentation = {
					view = "hover",
					---@type NoiceViewOptions
					opts = {
						lang = "markdown",
						replace = true,
						render = "plain",
						format = { "{message}" },
						win_options = { concealcursor = "n", conceallevel = 3 },
					},
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "search_count",
						find = "written",
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
		}
		noice.setup(config)
	end,
}
