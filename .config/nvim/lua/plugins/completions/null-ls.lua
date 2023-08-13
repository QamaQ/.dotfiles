return {

	"jose-elias-alvarez/null-ls.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local mason_null = require("mason-null-ls")

		mason_null.setup({ ensure_installed = { "stylua", "black", "ruff" } })

		-- for conciseness
		local formatting = null_ls.builtins.formatting -- to setup formatters
		local diagnostics = null_ls.builtins.diagnostics -- to setup linters

		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- configure null_ls
		null_ls.setup({
			sources = {
				formatting.stylua,
				--formatting.black,
				-- diagnostics.ruff
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}
