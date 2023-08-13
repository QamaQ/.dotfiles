return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = { "SmiteshP/nvim-navic" },
	config = function()
		vim.api.nvim_create_autocmd({
			"WinResized",
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",
			"BufWritePost",
			"TextChanged",
			"TextChangedI",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
		--
		local barbecue = require("barbecue")
		local colorscheme = require("colorscheme")
		local icons = require("core.icons")
		barbecue.setup({
			theme = colorscheme.winbar,
			create_autocmd = false,
			exclude_filetypes = { "alpha", "gitcommit", "netrw", "toggleterm", "Trouble" },
			show_dirname = true,
			show_modified = false,
			symbols = {
				modified = icons.ui.Circle,
			},
			modified = function(bufnr)
				return vim.bo[bufnr].modified
			end,
			show_navic = true,
			lead_custom_section = function()
				return " "
			end,
			custom_section = function()
				return " "
			end,
			context_follow_icon_color = false,
			kinds = icons.cmp_kinds,
		})
	end,
}
