-- NOTE: You can discover all highlight groups with ':hi'

local M = {}

---@source https://github.com/akinsho/bufferline.nvim/blob/main/lua/bufferline/colors.lua#L15
local function hex_to_rgb(color)
	local hex = color:gsub("#", "")
	return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5), 16)
end

---@source https://github.com/akinsho/bufferline.nvim/blob/main/lua/bufferline/colors.lua#L15
local function alter(attr, percent)
	return math.floor(attr * (100 + percent) / 100)
end

---@source https://stackoverflow.com/q/5560248
---see: https://stackoverflow.com/a/37797380
---Darken a specified hex color
---@param color string?
---@param percent number
---@return string
function M.tint(color, percent)
	if not color then
		return "NONE"
	end
	local r, g, b = hex_to_rgb(color)
	if not r or not g or not b then
		return "NONE"
	end
	r, g, b = alter(r, percent), alter(g, percent), alter(b, percent)
	r, g, b = math.min(r, 255), math.min(g, 255), math.min(b, 255)
	return ("#%02x%02x%02x"):format(r, g, b)
end

function M.fromhl(hl)
	local result = {}
	local list = vim.api.nvim_get_hl(0, { name = hl })
	for k, v in pairs(list) do
		if type(v) == "number" then
			result[k == "bg" and "bg" or "fg"] = ("#%06x"):format(v)
		end
	end
	return result
end

local function term(num, default)
	local key = "terminal_color_" .. num
	return vim.g[key] and vim.g[key] or default
end

function M.colors()
	-- TODO: Make these objects with "bg" and "fg" keys
	return {
		bg = M.fromhl("Normal").bg,
		fg = M.fromhl("Normal").fg,
		dim = M.fromhl("Conceal").fg,
		dark_fg = M.fromhl("StatusLine").fg,
		dark_bg = M.tint(M.fromhl("StatusLine").bg, -15),
		statusline_bg = M.fromhl("StatusLine").bg,
		statusline_fg = M.fromhl("StatusLine").fg,
		cursor_line_bg = M.fromhl("CursorLine").bg,
		cursor_line_fg = M.fromhl("CursorLine").fg,
		search_bg = M.fromhl("Search").bg,
		search_fg = M.fromhl("Search").fg,
		visual_bg = M.fromhl("Visual").bg,
		visual_fg = M.fromhl("Visual").fg,
		folded_bg = M.fromhl("Folded").bg,
		folded_fg = M.fromhl("Folded").fg,
		comment_bg = M.fromhl("Comment").bg,
		comment_fg = M.fromhl("Comment").fg,
		line_nr = M.fromhl("LineNr").fg,
		hint_fg = M.fromhl("DiagnosticHint").fg,
		hint_bg = M.fromhl("DiagnosticHint").bg,
		info_fg = M.fromhl("DiagnosticInfo").fg,
		info_bg = M.fromhl("DiagnosticInfo").bg,
		warn_fg = M.fromhl("DiagnosticWarn").fg,
		warn_bg = M.fromhl("DiagnosticWarn").bg,
		error_fg = M.fromhl("DiagnosticError").fg,
		error_bg = M.fromhl("DiagnosticError").bg,
		identifier_fg = M.fromhl("Identifier").fg,
		identifier_bg = M.fromhl("Identifier").bg,
		constant_fg = M.fromhl("Constant").fg,
		constant_bg = M.fromhl("Constant").bg,
		red_virtual_fg = M.fromhl("DiagnosticVirtualTextError").fg,
		red_virtual_bg = M.fromhl("DiagnosticVirtualTextError").bg,
		yellow_virtual_fg = M.fromhl("DiagnosticVirtualTextWarn").fg,
		yellow_virtual_bg = M.fromhl("DiagnosticVirtualTextWarn").bg,
		cyan_virtual_fg = M.fromhl("DiagnosticVirtualTextInfo").fg,
		cyan_virtual_bg = M.fromhl("DiagnosticVirtualTextInfo").bg,
		blue_virtual_fg = M.fromhl("DiagnosticVirtualTextHint").fg,
		blue_virtual_bg = M.fromhl("DiagnosticVirtualTextHint").bg,
		green_virtual_fg = M.fromhl("DiagnosticVirtualTextOk").fg,
		green_virtual_bg = M.fromhl("DiagnosticVirtualTextOk").bg,
		title_fg = M.fromhl("Title").fg,
		title_bg = M.fromhl("Title").bg,
		signcolumn_fg = M.fromhl("SignColumn").fg,
		signcolumn_bg = M.fromhl("SignColumn").bg,
		black = term(0, "#434C5E"),
		red = term(1, "#EC5F67"),
		green = term(2, "#8FBCBB"),
		yellow = term(3, "#EBCB8B"),
		blue = term(4, "#5E81AC"),
		magenta = term(5, "#B48EAD"),
		cyan = term(6, "#88C0D0"),
		white = term(7, "#ECEFF4"),
	}
end

function M.common_hls()
	local colors = M.colors()

	return {
		border_dim = { fg = colors.line_nr, bg = colors.dim },
		border_statusline = { fg = colors.comment_fg, bg = colors.statusline_bg },
		-- border_statusline = { fg = colors.cyan_virtual_fg, bg = colors.statusline_bg },
		border_normal = { fg = colors.fg, bg = colors.bg },
		border_statusline_rev = { fg = colors.statusline_bg },
		border_alt = { fg = colors.line_nr, bg = colors.cursor_line_bg },
		no_border_dim = { fg = colors.dim, bg = colors.dim },
		no_border_statusline = { fg = colors.statusline_bg, bg = colors.statusline_bg },
		no_border_alt = { fg = colors.cursor_line_bg, bg = colors.cursor_line_bg },
		no_border_dark = { fg = colors.dark_bg, bg = colors.dark_bg },
		red_virtual = { fg = colors.red_virtual_fg, bg = colors.red_virtual_bg },
		yellow_virtual = { fg = colors.yellow_virtual_fg, bg = colors.yellow_virtual_bg },
		cyan_virtual = { fg = colors.cyan_virtual_fg, bg = colors.cyan_virtual_bg },
		blue_virtual = { fg = colors.blue_virtual_fg, bg = colors.blue_virtual_bg },
		green_virtual = { fg = colors.green_virtual_fg, bg = colors.green_virtual_bg },
	}
end

function M.register_hls(groups)
	for group, attrs in pairs(groups) do
		local hl = vim.api.nvim_get_hl(0, { name = group })
		while hl["link"] do
			hl = vim.api.nvim_get_hl(0, { name = hl["link"] })
		end

		if type(attrs) == "string" then
			vim.api.nvim_set_hl(0, group, { link = attrs })
		elseif hl then
			for k, v in pairs(attrs) do
				hl[k] = v
			end
			vim.api.nvim_set_hl(0, group, hl)
		else
			vim.api.nvim_set_hl(0, group, attrs)
		end
	end
end

return M
