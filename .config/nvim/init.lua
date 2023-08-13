if vim.g.vscode then
	require("core.options")
-- require "core.keymaps"
else
	require("core.options")
	require("pluglazy")
	require("core.keymaps")

	require("colorscheme").searchTheme()
end

local o = vim.o
o.ls = 3 -- statusline, 0 para descativar o 3 para activar
o.showtabline = 0 -- 0 para descativar o 2 para activar
o.nu = false -- columna de numeros
o.ch = 0
o.showmode = false -- Dont show mode since we have a statusline
