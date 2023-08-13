return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "folke/neodev.nvim" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local utils = require("utils")
		local neodev = require("neodev")
		local icons = require("core.icons")

		-- mason
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
		mason_lspconfig.setup({
			ensure_installed = utils.language_servers,
			automatic_installation = false,
		})

		-- lspconfig
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = true,
			severity_sort = false,
		})

		--local signs = { Error = "", Warn = "", Hint = "", Info = "" }
		local signs = {
			Error = icons.diagnostic.error,
			Warn = icons.diagnostic.warn,
			Hint = icons.diagnostic.hint,
			Info = icons.diagnostic.info,
		}
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		local servers = utils.language_servers
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				capabilities = utils.capabilities,
				on_attach = utils.on_attach,
			})
		end

		neodev.setup()
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					-- diagnostics = {
					--     globals = { "vim" },
					-- },
					telemetry = {
						enable = false,
					},
					format = {
						enable = false,
					},
					hint = {
						enable = true,
						arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
						await = true,
						paramName = "All", -- "All", "Literal", "Disable"
						paramType = true,
						semicolon = "Disable", -- "All", "SameLine", "Disable"
						setType = true,
					},
					diagnostics = {
						globals = { "P" },
					},
					workspace = {
						checkThirdParty = false,
					},
				},
			},
		})

		lspconfig.texlab.setup({
			settings = {
				texlab = {
					auxDirectory = ".",
					bibtexFormatter = "texlab",
					build = {
						args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
						executable = "latexmk",
						forwardSearchAfter = false,
						onSave = true,
					},
					chktex = {
						onEdit = true,
						onOpenAndSave = true,
					},
					diagnosticsDelay = 300,
					formatterLineLength = 80,
					forwardSearch = {
						args = {},
					},
					latexFormatter = "latexindent",
					latexindent = {
						modifyLineBreaks = true,
					},
				},
			},
		})
		lspconfig.tsserver.setup({})
		-- lspconfig.html.setup({})
		-- lspconfig.cssls.setup({})
		require("lspconfig").emmet_language_server.setup({})
		-- lspconfig.emmet_language_server.setup({
		-- 	filetypes = {
		-- 		"css",
		-- 		"eruby",
		-- 		"html",
		-- 		"javascript",
		-- 		"javascriptreact",
		-- 		"less",
		-- 		"sass",
		-- 		"scss",
		-- 		"svelte",
		-- 		"pug",
		-- 		"typescriptreact",
		-- 		"vue",
		-- 	},
		-- 	init_options = {
		-- 		--- @type table<string, any> https://docs.emmet.io/customization/preferences/
		-- 		preferences = {},
		-- 		--- @type "always" | "never" defaults to `"always"`
		-- 		showexpandedabbreviation = "always",
		-- 		--- @type boolean defaults to `true`
		-- 		showabbreviationsuggestions = true,
		-- 		--- @type boolean defaults to `false`
		-- 		showsuggestionsassnippets = false,
		-- 		--- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
		-- 		syntaxprofiles = {},
		-- 		--- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
		-- 		variables = {},
		-- 		--- @type string[]
		-- 		excludelanguages = {},
		-- 	},
		-- })
	end,
}
