local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.foldingRange = {
	dynamicResgistration = false,
	lineFoldingOnly = true,
}
local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end
M.capabilities.textDocument.completion.completionItem.snippetSupport = false
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.language_servers = {
	"lua_ls",
	"pyright",
	"tsserver",
	"html",
	"cssls",
	"emmet_ls",
	"eslint",
	"bashls",
	"jsonls",
	"yamlls",
	"clangd",
	"ltex",
	"texlab",
	"vimls",
	"taplo",
	"vuels",
}

-- lsp cofing
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = false,
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	enable = true,
	border = "rounded",
	-- width = 10,
	-- height = 10,
})
--
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	enable = true,
	border = "rounded",
	-- width = 10,
	-- height = 10,
})
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
--     underline = true,
--     virtual_text = {
--         spacing = 5,
--         severity_limit = "Warning",
--     },
--     update_in_insert = true,
-- })
--
--
local rename = vim.lsp.handlers["textDocument/rename"]

local function parse_edits(entries, bufnr, text_edits)
	for _, edit in ipairs(text_edits) do
		local start_line = edit.range.start.line + 1
		local line = vim.api.nvim_buf_get_lines(bufnr, start_line - 1, start_line, false)[1]

		table.insert(entries, {
			bufnr = bufnr,
			lnum = start_line,
			col = edit.range.start.character + 1,
			text = line,
		})
	end
end

-- Populates the quickfix list with all rename locations.
vim.lsp.handlers["textDocument/rename"] = function(err, result, ...)
	rename(err, result, ...)
	if err then
		return
	end

	local entries = {}
	if result.changes then
		for uri, edits in pairs(result.changes) do
			local bufnr = vim.uri_to_bufnr(uri)
			parse_edits(entries, bufnr, edits)
		end
	elseif result.documentChanges then
		for _, doc_change in ipairs(result.documentChanges) do
			if doc_change.textDocument then
				local bufnr = vim.uri_to_bufnr(doc_change.textDocument.uri)
				parse_edits(entries, bufnr, doc_change.edits)
			else
				vim.notify(("Failed to parse TextDocumentEdit of kind: %s"):format(doc_change.kind or "N/A"))
			end
		end
	end
	vim.fn.setqflist(entries)
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "solid",
})

local group = vim.api.nvim_create_augroup("lsp_document_codelens", {})

---@param bufnr number
local function buf_autocmd_codelens(bufnr)
	vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost", "CursorHold" }, {
		buffer = bufnr,
		group = group,
		callback = function()
			vim.lsp.codelens.refresh()
		end,
	})
end

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client.supports_method("textDocument/codeLens") then
			buf_autocmd_codelens(bufnr)
			vim.schedule(vim.lsp.codelens.refresh)
		end
	end,
})

-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
vim.api.nvim_create_autocmd("CursorHold", {
	buffer = bufnr,
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = " ",
			scope = "cursor",
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set("n", "<space>le", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

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
		vim.keymap.set("n", "<space>lf", function()
			vim.lsp.buf.format({ async = true }) -- formateo de codigo
		end, opts)
	end,
})

return M
