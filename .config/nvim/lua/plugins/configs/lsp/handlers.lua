local M = {}

local keymap = vim.keymap
local diagnostic = vim.diagnostic
local api = vim.api
local lsp = vim.lsp
local fn = vim.fn

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

M.capabilities = lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities()

M.setup = function()
	local icons = require("core.ui.icons")

	local config = {
		virtual_text = false,
		signs = true,
		underline = true,
		update_in_insert = true,
		severity_sort = true,
	}

	diagnostic.config(config)

	local signs = {
		Error = icons.diagnosticSign.Error,
		Warn = icons.diagnosticSign.Warning,
		Hint = icons.diagnosticSign.Hint,
		Info = icons.diagnosticSign.Information,
	}
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, { border = "rounded" })

	lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, { border = "rounded" })

	vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])
end

local function attach_navic(client, bufnr)
	vim.g.navic_silence = true
	local status_ok, navic = pcall(require, "nvim-navic")
	if not status_ok then
		return
	end
	navic.attach(client, bufnr)
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
keymap.set("n", "<space>e", diagnostic.open_float, opts)
keymap.set("n", "[d", diagnostic.goto_prev, opts)
keymap.set("n", "]d", diagnostic.goto_next, opts)
keymap.set("n", "<space>q", diagnostic.setloclist, opts)

local util = require("vim.lsp.util")

local formatting_callback = function(client, bufnr)
	keymap.set("n", "<leader>f", function()
		local params = util.make_formatting_params({})
		client.request("textDocument/formatting", params, nil, bufnr)
	end, { buffer = bufnr })
end

local function lsp_keymaps(bufnr)
	-- Enable completion triggered by <c-x><c-o>
	api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	keymap.set("n", "gD", lsp.buf.declaration, bufopts)
	keymap.set("n", "gd", lsp.buf.definition, bufopts)
	keymap.set("n", "K", lsp.buf.hover, bufopts)
	keymap.set("n", "gi", lsp.buf.implementation, bufopts)
	keymap.set("n", "<C-k>", lsp.buf.signature_help, bufopts)
	keymap.set("n", "<space>wa", lsp.buf.add_workspace_folder, bufopts)
	keymap.set("n", "<space>wr", lsp.buf.remove_workspace_folder, bufopts)
	keymap.set("n", "<space>wl", function()
		print(vim.inspect(lsp.buf.list_workspace_folders()))
	end, bufopts)
	keymap.set("n", "<space>D", lsp.buf.type_definition, bufopts)
	keymap.set("n", "<space>rn", lsp.buf.rename, bufopts)
	keymap.set("n", "<space>ca", lsp.buf.code_action, bufopts)
	keymap.set("n", "gr", lsp.buf.references, bufopts)
	keymap.set("n", "<space>f", function()
		lsp.buf.format({ async = true })
	end, bufopts)
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)
	formatting_callback(client, bufnr)
	attach_navic(client, bufnr)
end

M.lsp_flags = { debounce_text_changes = 150 }

function M.enable_format_on_save()
	vim.cmd([[
    augroup format_on_save
      autocmd! 
      autocmd BufWritePre * lua vim.lsp.buf.format({ async = false }) 
    augroup end
  ]])
	vim.notify("Enabled format on save")
end

function M.disable_format_on_save()
	M.remove_augroup("format_on_save")
	vim.notify("Disabled format on save")
end

function M.toggle_format_on_save()
	if fn.exists("#format_on_save#BufWritePre") == 0 then
		M.enable_format_on_save()
	else
		M.disable_format_on_save()
	end
end

function M.remove_augroup(name)
	if fn.exists("#" .. name) == 1 then
		vim.cmd("au! " .. name)
	end
end

vim.cmd([[ command! LspToggleAutoFormat execute 'lua require("plugins.configs.lsp.handlers").toggle_format_on_save()' ]])

return M
