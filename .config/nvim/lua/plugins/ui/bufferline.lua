local M = {}

M.bufferline = {
	"akinsho/bufferline.nvim",
	event = "UIEnter",
	config = function()
		local fn = vim.fn
		local status_ok, bufferline = pcall(require, "bufferline")
		if not status_ok then
			return
		end
		local icons = require("core.icons")
		-- local icons =
		local config = {
			options = {
				debug = { logging = true },
				style_preset = { bufferline.style_preset.minimal },
				mode = "buffers",
				sort_by = "insert_after_current",
				move_wraps_at_ends = true,
				right_mouse_command = "vert sbuffer %d",
				modified_icon = icons.ui.Circle,
				show_close_icon = false,
				show_buffer_close_icons = true,
				indicator = { style = "underline" },
				diagnostics = "nvim_lsp",
				-- diagnostics_indicator = function(count, level)
				-- 	level = level:match("warn") and "warn" or level
				-- 	return (icons[level] or "?") .. " " .. count
				-- end,
				diagnostics_update_in_insert = false,
				custom_filter = function(buf_number)
					if not not vim.api.nvim_buf_get_name(buf_number):find(vim.fn.getcwd(), 0, true) then
						return true
					end
				end,
				hover = { enabled = true, reveal = { "close" } },
				offsets = {
					{
						text = "EXPLORER",
						filetype = "NvimTree",
						-- highlight = "PanelHeading",
						text_align = "left",
						separator = true,
					},
					{
						text = " FLUTTER OUTLINE",
						filetype = "flutterToolsOutline",
						highlight = "PanelHeading",
						separator = true,
					},
					{
						text = "UNDOTREE",
						filetype = "undotree",
						highlight = "PanelHeading",
						separator = true,
					},
					{
						text = "󰆼 DATABASE VIEWER",
						filetype = "dbui",
						highlight = "PanelHeading",
						separator = true,
					},
					{
						text = " DIFF VIEW",
						filetype = "DiffviewFiles",
						highlight = "PanelHeading",
						separator = true,
					},
				},
				groups = {
					options = { toggle_hidden_on_enter = true },
					items = {
						--bufferline.groups.builtin.pinned:with({ icon = "" }),
						--bufferline.groups.builtin.ungrouped,
						{
							name = "Dependencies",
							icon = "",
							highlight = { fg = "#ECBE7B" },
							matcher = function(buf)
								return vim.startswith(buf.path, vim.env.VIMRUNTIME)
							end,
						},

						{
							name = "SQL",
							matcher = function(buf)
								return buf.name:match("%.sql$")
							end,
						},

						{
							name = "docs",
							icon = "",
							matcher = function(buf)
								if vim.bo[buf.id].filetype == "man" or buf.path:match("man://") then
									return true
								end
								for _, ext in ipairs({ "md", "txt", "org", "norg", "wiki" }) do
									if ext == fn.fnamemodify(buf.path, ":e") then
										return true
									end
								end
							end,
						},
					},
				},
			},
		}
		-- bufferline.setup(config)
		-- map("n", "[b", "<Cmd>BufferLineMoveNext<CR>", { desc = "bufferline: move next" })
		-- map("n", "]b", "<Cmd>BufferLineMovePrev<CR>", { desc = "bufferline: move prev" })
		-- map("n", "gbb", "<Cmd>BufferLinePick<CR>", { desc = "bufferline: pick buffer" })
		-- map("n", "gbd", "<Cmd>BufferLinePickClose<CR>", { desc = "bufferline: delete buffer" })
		-- map("n", "<S-tab>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "bufferline: prev" })
		-- map("n", "<leader><tab>", "<Cmd>BufferLineCycleNext<CR>", { desc = "bufferline: next" })
		return config
	end,
}
return M.bufferline
