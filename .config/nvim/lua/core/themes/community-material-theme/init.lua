local M = {}
local theme = require("core.themes.community-material-theme.theme")

M.setup = function()
	vim.cmd("hi clear")

	vim.o.background = "dark"
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.opt.termguicolors = true
	vim.o.termguicolors = true
	vim.g.colors_name = "night-owl"

	theme.set_highlights()
end

return M
