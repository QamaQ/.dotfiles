local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
	return
end


vim.opt.list = true
vim.g.indentLine_enabled = 1
-- vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_char = "▏"
indent.setup{
	show_current_context = true,
	show_current_context_start = false,
}
