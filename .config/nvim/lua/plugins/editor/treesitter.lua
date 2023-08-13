return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/playground",
	},
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")
		treesitter.setup({
			ensure_installed = {
				"lua",
				"python",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"yaml",
				"latex",
			},
			sync_install = true,
			auto_install = false,
			ignore_install = {},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
		})
	end,
}
