local M = {}

M.blink = true
M.numbers = false

function M.toggle_blink()
	M.blink = not M.blink
	vim.notify('Blink ' .. (M.blink and 'on' or 'off'))
end

function M.toggle_numbers()
	M.numbers = not M.numbers
	vim.opt.number = M.numbers
	vim.opt.relativenumber = false
	vim.notify('Numbers ' .. (M.numbers and 'on' or 'off'))
end

return M
