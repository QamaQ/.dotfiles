local status_color, colors = pcall(require, 'material.colors')
if not status_color then
	return
end

local hl = vim.api.nvim_set_hl
local theme = {}

theme.set_highlights = function()
	hl(0,  "BufferLineIndicatorSelected", { fg = "#ff00ff" })
  hl(0, "BufferCurrent", { bg = "#00ff00"})
  hl(0, "BufferCurrentIndex", { bg = "#0f0f0f" })
 	hl(0, "BufferCurrentMod", { bg = "#00f0f0"})
	hl(0, "BufferCurrentSign", { bg = "#ff0f0f" })
	hl(0, "BufferCurrentTarget", { bg = "#fff0f0", bold = true, })
--hl(0, "BufferVisible", { fg = c.fg, bg = c.bg })
--hl(0, "BufferVisibleIndex", { fg = c.fg, bg = c.bg })
--hl(0, "BufferVisibleMod", { fg = c.info, bg = c.bg })
--hl(0, "BufferVisibleSign", { fg = c.gray, bg = c.bg })
--hl(0, "BufferVisibleTarget", { fg = c.red, bg = c.bg, bold = true, })
--hl(0, "BufferInactive", { fg = c.gray, bg = c.alt_bg })
--hl(0, "BufferInactiveIndex", { fg = c.gray, bg = c.alt_bg })
--hl(0, "BufferInactiveMod", { fg = c.info, bg = c.alt_bg })
--hl(0, "BufferInactiveSign", { fg = c.gray, bg = c.alt_bg })
--hl(0, "BufferInactiveTarget", { fg = c.red, bg = c.alt_bg, bold = true, })
end

return theme
