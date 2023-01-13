local M = {}

M.kind = {
	Text = " ",
	Method = " ",
	Function = " ",
	Constructor = " ",
	Field = " ",
	Variable = " ",
	Class = " ",
	Interface = " ",
	Module = " ",
	Property = " ",
	Unit = " ",
	Value = " ",
	Enum = " ",
	Keyword = " ",
	Snippet = " ",
	Color = " ",
	File = " ",
	Reference = " ",
	Folder = " ",
	EnumMember = " ",
	Constant = ' ', --" ",
	Struct = " ",
	Event = " ",
	Operator = " ",
	TypeParameter = " ",
	Misc = " ",
}

M.diagnosticSign = {
	Error = " ",
	Warning = " ",
	Information = " ",
	Question = " ",
	Hint = " ",
}

M.ui = {
	NewFile = " ",
	ChevronRight = "",
	Circle = " ",
	History = " ",
	List = " ",
	SignIn = " ",
	Gear = " ",
	CloudDownload = " ",
	SignOut = " ",
}
M.documents = {
	File = " ",
	Files = " ",
	Folder = " ",
	OpenFolder = " ",
}
M.git = {
	Add = " ",
	Mod = " ",
	Remove = " ",
	Ignore = " ",
	Rename = " ",
	Diff = " ",
	Repo = " ",
	Octoface = " ",
}

return M
