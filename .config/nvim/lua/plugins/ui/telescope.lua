return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"-L",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = "   ",
				selection_caret = "  ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "ascending",
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				file_ignore_patterns = { "node_modules" },
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				path_display = { "truncate" },
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				-- Developer configurations: Not meant for general override
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				mappings = {
					n = { ["q"] = require("telescope.actions").close },
				},
			},
			pickers = {

				live_grep = {
					theme = "dropdown",
				},
				grep_string = {
					theme = "dropdown",
				},
				find_files = {
					theme = "dropdown",
					previewer = false,
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
					initial_mode = "normal",
				},
				planets = {
					show_pluto = true,
					show_moon = true,
				},
				colorscheme = {
					-- enable_preview = true,
				},
				lsp_references = {
					theme = "dropdown",
					initial_mode = "normal",
				},
				lsp_definitions = {
					theme = "dropdown",
					initial_mode = "normal",
				},
				lsp_declarations = {
					theme = "dropdown",
					initial_mode = "normal",
				},
				lsp_implementations = {
					theme = "dropdown",
					initial_mode = "normal",
				},

				-- Default configuration for builtin pickers goes here:
				-- picker_name = {
				--   picker_config_key = value,
				--   ...
				-- }
				-- Now the picker_config_key will be applied every time you call this
				-- builtin picker
			},
			extensions = {
				media_files = {
					-- filetypes whitelist
					-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
					filetypes = { "png", "webp", "jpg", "jpeg" },
					find_cmd = "rg", -- find command (defaults to `fd`)
				},
			},
		})
	end,
}
