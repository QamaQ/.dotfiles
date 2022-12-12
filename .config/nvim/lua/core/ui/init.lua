require('core.ui.icons.devicons')


local themes = 'material'

if themes == 'material' then
	require('core.ui.themes.material')

	local material = require('core.ui.themes.material.lualine')
	local status_ok, lualine = pcall(require, 'lualine')
	if not status_ok then
		return
	end
	lualine.setup({ options = { theme = material } })
elseif themes == 'onedarkpro' then
	require('core.ui.themes.onedarkpro')
end


-- require ('core.ui.themes.onedarkpro')
