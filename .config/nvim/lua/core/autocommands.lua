vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lir" },
	callback = function()
		vim.opt_local.number = true
		-- vim.opt_local.laststatus = 3
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
