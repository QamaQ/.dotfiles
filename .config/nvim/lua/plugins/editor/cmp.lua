local M = {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp", event = "InsertEnter" },
    { "hrsh7th/cmp-buffer", event = "InsertEnter" },
    { "hrsh7th/cmp-path", event = "InsertEnter" },
    { "hrsh7th/cmp-cmdline", event = "InsertEnter" },
    { "saadparwaiz1/cmp_luasnip", event = "InsertEnter" },
    {
      "L3MON4D3/LuaSnip",
      event = "InsertEnter",
      dependencies = {
        "rafamadriz/friendly-snippets",
      },
    },
    { "hrsh7th/cmp-nvim-lua",},
		{ "onsails/lspkind.nvim", event = "InsertEnter"}
  },
  event = "InsertEnter",
}

function M.config()
	local cmp = require("cmp")
  local luasnip = require "luasnip"
	local lspkind = require("lspkind")

	lspkind.init{
		preset = 'codicons',
	}

	-- require("luasnip/loaders/from_vscode").lazy_load()
	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body) -- For `luasnip` users.
			end
		},
	  formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
        local strings = vim.split(kind.kind, "%s", { trimempty = true })
        kind.kind = (strings[1] or "") .. " "
        kind.menu = " " .. (strings[2] or "") .. ""

        return kind
      end,
    },
    mapping = cmp.mapping.preset.insert{
      ['<C-Space>'] = cmp.mapping.complete(),
      -- ['<CR>'] = cmp.mapping.confirm({ select = true })
      ['<CR>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          if luasnip.expandable() then
            luasnip.expand()
          else
            cmp.confirm({
              select = true,
            })
          end
        else
          fallback()
        end
      end),
    },
		sources = cmp.config.sources({
			{ name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "buffer" },
   		{ name = "luasnip" },
      { name = "path" },

		})
	})
end

return M
