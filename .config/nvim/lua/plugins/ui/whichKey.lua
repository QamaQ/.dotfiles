return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	config = function()
		local wk = require("which-key")
		wk.setup({
			window = {
				-- border = "single",
				position = "bottom",
				margin = { 1, 0, 1, 0 },
				padding = { 0, 0, 0, 0 },
			},
			layout = {
				align = "center",
			},
		})
	end,
}
