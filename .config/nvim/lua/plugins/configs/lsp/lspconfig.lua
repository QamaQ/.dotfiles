local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end


local servers = { "sumneko_lua", "tsserver", "pyright", "html", "cssls" }

local handlers = require("plugins.configs.lsp.handlers")

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup{
		on_attach = handlers.on_attach,
		flags = handlers.lsp_flags,
		capabilities = handlers.capabilities,
	}
end


