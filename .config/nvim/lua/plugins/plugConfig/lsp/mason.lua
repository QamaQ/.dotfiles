local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
	return
end

local servers = {
	"sumneko_lua",
	"pyright",
	"tsserver",
	"clangd",
    "cssls",
    "html",
    "emmet_ls"
}

local settings = {
	ui = {
		border = "rounded",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
	ensure_installed = servers,
	automatic_installation = true,
})

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}
for _, server in pairs(servers) do
	opts = {
		on_attach = require("plugins.plugConfig.lsp.handlers").on_attach,
		capabilities = require("plugins.plugConfig.lsp.handlers").capabilities,
	}

	if server == "tsserver" then
		local tsserver_opts = require("plugins.plugConfig.lsp.settings.tsserver")
		opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
	end
	if server == "sumneko_lua" then
		local sumneko_opts = require("plugins.plugConfig.lsp.settings.sumneko_lua")
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

	if server == "pyright" then
		local pyright_opts = require("plugins.plugConfig.lsp.settings.pyright")
		opts = vim.tbl_deep_extend("force", pyright_opts, opts)
	end

	if server == "clangd" then
		local clangd_opts = require("plugins.plugConfig.lsp.settings.clangd")
		opts = vim.tbl_deep_extend("force", clangd_opts, opts)
	end

	--server start
	lspconfig[server].setup(opts)
end
