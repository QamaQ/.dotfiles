
local status_ok, colors = pcall(require, 'material.colors')
if not status_ok then
	return
end


local Material = {
	normal = {
		a = { bg = colors.editor.bg, fg = colors.main.cyan, bold = false },
		b = { bg = colors.editor.bg, fg = colors.syntax.comments },
		c = { bg = colors.editor.bg, fg = colors.syntax.comments },
		z = { bg = colors.editor.bg, fg = colors.syntax.comments }
	},
	insert = {
		a = { bg = colors.editor.bg, fg = colors.main.green},
		z = { bg = colors.editor.bg, fg = colors.syntax.comments }
	},
	visual = {
		a = { bg = colors.editor.bg, fg = colors.main.darkpurple},
		z = { bg = colors.editor.bg, fg = colors.syntax.comments }
	},
	inactive = {
		a = { bg = colors.editor.bg, fg = colors.main.cyan, bold = false },
		b = { bg = colors.editor.bg, fg = colors.syntax.comments },
		c = { bg = colors.editor.bg, fg = colors.syntax.comments },
		z = { bg = colors.editor.bg, fg = colors.syntax.comments }
	}
}

return Material
