return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		{ "rafamadriz/friendly-snippets" },
		"saadparwaiz1/cmp_luasnip",
		"lukas-reineke/cmp-rg",
		"FelipeLema/cmp-async-path",
		"onsails/lspkind.nvim",
		"kdheepak/cmp-latex-symbols",
	},
	config = function()
		-- luasnip setup
		local api = vim.api
		local luasnip = require("luasnip")
		local icons = require("core.icons")
		local lspkind_ok, lspkind = pcall(require, "lspkind")
		local kind_icons = icons.cmp_kinds
		lspkind.init({
			-- mode = "symbol_text",
			preset = "codicons",
			symbol_map = icons.cmp_kinds,
		})
		require("luasnip.loaders.from_vscode").lazy_load()

		-- nvim-cmp setup
		local cmp = require("cmp")
		local has_words_before = function()
			local line, col = unpack(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end

		-- local ellipsis = ui.icons.misc.ellipsis
		local MIN_MENU_WIDTH, MAX_MENU_WIDTH = 25, math.min(50, math.floor(vim.o.columns * 0.5))

		local source_names = {
			nvim_lsp = "[LSP]",
			treesitter = "[Tre]",
			luasnip = "[LuaSnip]",
			buffer = "[Buffer]",
			nvim_lua = "[Lua]",
			path = "[Path]",
			calc = "[Clc]",
			emoji = "[Emj]",
			rg1 = "[Rg]",
			orgmode = "[Org]",
			crates = "[Crg]",
			latex_symbols = "[LaTeX]",
		}
		local duplicates = {
			buffer = 1,
			path = 1,
			nvim_lsp = nil,
			luasnip = 1,
		}
		local duplicates_default = nil
		local config = {
			enabled = function()
				return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
			end,
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = {
				-- completeopt = "menu,menuone",
				keyword_length = 1,
			},
			experimental = {
				native_menu = false,
				ghost_text = false,
			},
			formatting = {
				-- fields = { "kind", "abbr", "menu" },
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					if vim.tbl_contains({ "path" }, entry.source.name) then
						local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
						if icon then
							vim_item.kind = icon
							vim_item.kind_hl_group = hl_group
							return vim_item
						end
					end
					-- vim_item.kind = icons.cmp_kinds[vim_item.kind] .. " "
					-- vim_item.menu = source_names[entry.source.name]
					-- vim_item.dup = duplicates[entry.source.name] or duplicates_default
					-- return vim_item

					-- return require("lspkind").cmp_format({ with_text = false })(entry, vim_item)

					-- if not lspkind_ok then
					-- 	-- From kind_icons array
					-- 	vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
					-- 	-- Source
					-- 	vim_item.menu = ({
					-- 		buffer = "[Buffer]",
					-- 		nvim_lsp = "[LSP]",
					-- 		luasnip = "[LuaSnip]",
					-- 		nvim_lua = "[Lua]",
					-- 		latex_symbols = "[LaTeX]",
					-- 	})[entry.source.name]
					-- 	return vim_item
					-- else
					-- 	-- From lspkind
					-- 	return lspkind.cmp_format()(entry, vim_item)
					-- end
					local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = (strings[1] or "") .. " "
					kind.menu = (strings[2] or "")

					return kind
				end,
				-- --
				-- local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
				-- local strings = vim.split(kind.kind, "%s", { trimempty = false })
				-- kind.kind = " " .. (strings[1] or "")
				-- kind.menu = (strings[2] or "")
				-- return kind
				-- format = lspkind.cmp_format({
				-- 	mode = "symbol",
				-- 	maxwidth = MAX_MENU_WIDTH,
				-- 	-- ellipsis_char = ellipsis,
				-- 	before = function(_, vim_item)
				-- 		local label, length = vim_item.abbr, api.nvim_strwidth(vim_item.abbr)
				-- 		if length < MIN_MENU_WIDTH then
				-- 			vim_item.abbr = label .. string.rep(" ", MIN_MENU_WIDTH - length)
				-- 		end
				-- 		return vim_item
				-- 	end,
				-- 	menu = {
				-- 		nvim_lsp = "[LSP]",
				-- 		nvim_lua = "[LUA]",
				-- 		emoji = "[EMOJI]",
				-- 		path = "[PATH]",
				-- 		neorg = "[NEORG]",
				-- 		luasnip = "[SNIP]",
				-- 		dictionary = "[DIC]",
				-- 		buffer = "[BUF]",
				-- 		spell = "[SPELL]",
				-- 		orgmode = "[ORG]",
				-- 		norg = "[NORG]",
				-- 		rg = "[RG]",
				-- 		git = "[GIT]",
				-- 	},
				--}),
			},
			window = {
				-- documentation = cmp.config.window.bordered(),
				-- completion = cmp.config.window.bordered()
				completion = {
					border = "rounded",
					winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
					scrollbar = false,
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "async_path" },
				{
					name = "latex_symbols",
					option = {
						strategy = 0,
					},
				},
				-- { name = "rg" },
			}, {
				{ name = "buffer" },
			}),
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
		}
		cmp.setup(config)

		-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline({ "/", "?" }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
