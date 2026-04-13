local M = {
	"folke/which-key.nvim",
	lazy = false,
}
local keys = {}
function M.config()
	local icons = require("core.icons")

	require("which-key").setup({
		preset = "helix",
		icons = {
			breadcrumb = icons.arrow.double_right_short, -- symbol used in the command line area that shows your active key combo
			separator = icons.bar.vertical_center_thin, -- symbol used between a key and it's label
			group = icons.folder.open .. " ", -- symbol prepended to a group
		},
		win = {
			border = "none", -- none, single, double, shadow
			title = true, -- does not matter unless boder != "none"
			title_pos = "center", -- does not matter unless boder != "none"
			padding = { 2, 6 }, -- extra window padding [top/bottom, right/left]
		},
		show_help = false, -- show help message on the command line when the popup is visible
		show_keys = true, -- show the currently pressed key and its label as a message in the command line
	})

	require("keymaps").register(keys)

	local hls = require("core.hls")
	local c = hls.colors()
	local common_hls = hls.common_hls()
	hls.register_hls({
		WhichKeyNormal = { fg = c.fg, bg = c.bg },
		WhichKeyBorder = common_hls.no_border_statusline,
	})
end

return M
