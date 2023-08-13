local icons = require("core.icons")
local M = {}

M.language_servers =
	{ "lua_ls", "pyright", "vimls", "bashls", "vimls", "texlab", "tsserver", "html", "cssls", "emmet_language_server" }

M.on_attach = function(client, bufnr, _)
	client.server_capabilities.documentFormattingProvider = true
	client.server_capabilities.documentRangeFormattingProvider = true
	client.server_capabilities.semanticTokensProvider = nil

	if client.server_capabilities["documentSymbolProvider"] then
		local status_ok, navic = pcall(require, "nvim-navic")
		if not status_ok then
			return
		end
		navic.attach(client, bufnr)
	end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.foldingRange = {
	dynamicResgistration = true,
	lineFoldingOnly = true,
}
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>le", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", opts)
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", "<cmd>Telescope lsp_type_definitions<cr>", opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		-- vim.keymap.set("n", "<space>lf", function()
		-- 	vim.lsp.buf.format({ async = true }) -- formateo de codigo
		-- end, opts)
	end,
})

function M.toggle_option(option)
	local value = not vim.api.nvim_get_option_value(option, {})
	vim.opt[option] = value
end

function M.toggle_statusline()
	local value = vim.api.nvim_get_option_value("laststatus", {})
	if value == 3 then
		value = 0
	else
		value = 3
		local status_lualine, lualine = pcall(require, "lualine")
		if not status_lualine then
			return
		end
		local config = require("plugins.ui.lualine").config()
		lualine.setup(config)
	end

	vim.opt.laststatus = value
end

function M.toggle_tabline()
	local value = vim.api.nvim_get_option_value("showtabline", {})

	if value == 2 then
		value = 0
	else
		value = 2
		local status_buffer, bufferline = pcall(require, "bufferline")
		local config = require("plugins.ui.bufferline").config()
		if not status_buffer then
			return
		end
		bufferline.setup(config)
	end

	vim.opt.showtabline = value
end

function M.fg(name)
	---@type {foreground?:number}?
	local hl = vim.api.nvim_get_hl and vim.api.nvim_get_hl(0, { name = name })
		or vim.api.nvim_get_hl_by_name(name, true)
	local fg = hl and hl.fg or hl.foreground
	return fg and { fg = string.format("#%06x", fg) }
end
return M
