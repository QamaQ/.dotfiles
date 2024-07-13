local M = {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	event = "VeryLazy",
	-- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
}

function M.config()
	local wk = require("which-key")
	wk.register{
		["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Buscar Archivos" },
		["<leader>fb"] = { "<cmd>Telescope diagnostics<cr>", "Mostrar Problemas" }
	}

	local tlp = require("telescope")
	local icons = require("plugins.core").opts.icons
	tlp.setup({
		defaults = {
			prompt_prefix = icons.misc.Telescope .. " ",
			selection_caret = icons.misc.ArrowClosed .. " ",

		},
		pickers = {
			find_files = {
				theme = "dropdown",
				previewer = false
			}
		}
	})
end

return M
