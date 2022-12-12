-- https://github.com/microsoft/vscode/blob/main/src/vs/base/common/codicons.ts
-- go to the above and then enter <c-v>u<unicode> and the symbold should appear
-- or go here and upload the font file: https://mathew-kurian.github.io/CharacterMap/
-- find more here: https://www.nerdfonts.com/cheat-sheet
--

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
	Constant = " ",
	Struct = " ",
	Event = " ",
	Operator = " ",
	TypeParameter = " ",
	Misc = " ",
}
M.type = {
	Array = " ",
	Number = " ",
	String = " ",
	Boolean = " ",
	Object = " ",
}
M.documents = {
	File = "",
	Files = "",
	Folder = "",
	OpenFolder = "",
}
M.git = {
	Add = " ",
	Mod = " ",
	Remove = " ",
	Ignore = " ",
	Rename = " ",
	Diff = " ",
	Repo = " ",
	init = " ",
}
M.ui = {
	ArrowClosed = "",
	ArrowOpen = "",
	Lock = " ",
	Circle = " ",
	BigCircle = " ",
	BigUnfilledCircle = " ",
	Close = " ",
	NewFile = " ",
	Search = " ",
	Lightbulb = " ",
	Project = " ",
	Dashboard = " ",
	History = " ",
	Comment = " ",
	Bug = " ",
	Code = " ",
	Telescope = " ",
	Gear = " ",
	Package = " ",
	List = " ",
	SignIn = " ",
	SignOut = " ",
	NoteBook = " ",
	Check = " ",
	Fire = " ",
	Note = " ",
	BookMark = " ",
	Pencil = " ",
	ChevronRight = "",
	Table = " ",
	Calendar = " ",
	CloudDownload = " ",
}
M.diagnostics = {
	Error = " ",
	Warning = " ",
	Information = " ",
	Question = " ",
	Hint = " ",
}
M.misc = {
	Robot = " ",
	Squirrel = " ",
	Tag = " ",
	Watch = " ",
	Smiley = " ",
	Package = " ",
	CircuitBoard = " ",
}
M.git_explorer = {
	unstaged = "✗",
	staged = "✓",
	unmerged = "",
	renamed = "➜",
	untracked = "U",
	deleted = "",
	ignored = "◌",
}
return M
