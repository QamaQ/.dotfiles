return {
	"serhez/teide.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("teide").setup({
			style = "darker",

			on_colors = function(colors)
				colors.bg = "#0A0A0A"
				-- colors.fg = "#EEFFFF"
				colors.bg_darker = "#0A0A0A"
				colors.bg_float = "#090909"
				colors.bg_popup = "#090909"
				colors.bg_sidebar = "#090909"
				colors.bg_statusline = "#090909"
			end,
		on_highlights = function(hl, c)
			hl.VertSplit = { fg = "#2C313A" }
			-- hl.WinSeparator = { fg = "red", bg = "#EEFFFF" }
		end,
			transparent = true,
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
		})
		vim.cmd.colorscheme("teide")
		-- require("core.hls").setup()
	end,
}
