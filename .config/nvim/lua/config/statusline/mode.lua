local M = {}

local map = {
	n = "NORMAL",
	i = "INSERT",
	v = "VISUAL",
	V = "V-LINE",
	["\22"] = "V-BLOCK",
	c = "COMMAND",
	s = "SELECT",
	S = "S-LINE",
	R = "REPLACE",
	t = "TERMINAL",
}

local hl = {
	n = "Directory",
	i = "String",
	v = "Keyword",
	V = "Keyword",
	["\22"] = "Keyword",
	c = "WarningMsg",
	s = "Keyword",
	S = "Keyword",
	R = "ErrorMsg",
	t = "Special",
}

function M.get()
	local m = vim.fn.mode()
	local label = map[m] or m:upper()
	local group = hl[m] or "Directory"
	return "%#" .. group .. "# " .. label .. " "
end

return M
