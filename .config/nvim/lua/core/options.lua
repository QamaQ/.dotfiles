local o = vim.o
local opt = vim.opt

o.number = true
opt.laststatus = 3
o.cmdheight=0
o.termguicolors=true
o.mouse="a"
opt.numberwidth=4
opt.wrap=false

opt.shiftwidth=4
opt.tabstop=4
opt.autoindent = true
opt.expandtab = true
opt.smartindent = true
opt.title=true

opt.cursorline=true
o.clipboard = "unnamedplus"



opt.backspace = "indent,eol,start"

opt.backup = false

opt.fillchars = opt.fillchars + "eob: "
opt.fillchars:append({
	stl = " ",
})

