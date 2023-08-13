local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)
keymap("i", "<C-b>", "<cmd>NvimTreeFocus<cr>", opts) -- Enfocar explorador de archivos en modo INSERT
keymap("n", "<C-b>", "<cmd>NvimTreeFocus<cr>", opts) -- Enfocar explorador de archivos en modo INSERT
keymap("n", "<C-s>", "<cmd>w<cr>", opts) -- Guardar archivo en modo NORMAL
keymap("i", "<C-s>", "<cmd>w<cr>", opts) -- Guardar archivo en modo INSERT

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Left>", "<C-w>h", opts)

keymap("n", "<C-Right>", "<C-w>l", opts)

keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

local status_wk, wk = pcall(require, "which-key")
if not status_wk then
	-- keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts) -- Enfocar explorador de archivos en modo NORMAL
	-- buffers Navigators

	-- Telescope
	keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
	keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
	keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
	keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)

	-- Treesitter
	keymap("n", "<leader>th", "<cmd>TSHighlightCaptireUnderCursor<cr>", opts)

	-- terminal
	keymap("n", "<leader>tt", "<cmd>ToggleTerm<cr>", opts)
	-- latex
	-- set shorter name for keymap function
	local kmaps = vim.keymap.set

	-- F5 processes the document once, and refreshes the view
	kmaps({ "n", "v", "i" }, "<F5>", function()
		require("knap").process_once()
	end)

	-- F6 closes the viewer application, and allows settings to be reset
	kmaps({ "n", "v", "i" }, "<F6>", function()
		require("knap").close_viewer()
	end)

	-- F7 toggles the auto-processing on and off
	kmaps({ "n", "v", "i" }, "<F7>", function()
		require("knap").toggle_autopreviewing()
	end)

	-- F8 invokes a SyncTeX forward search, or similar, where appropriate
	kmaps({ "n", "v", "i" }, "<F8>", function()
		require("knap").forward_jump()
	end)
end
--
--

local mappings = {
	-- splits
	s = {
		name = "splits",
		v = { "<C-w>v", "Split vertical" },
		h = { "<C-x>x", "Split horizontal" },
		e = { "<C-w>=", "Restablecer el split" },
		x = { "<cmd>Close<cr>", "Cerrar split" },
	},

	e = { "<cmd>NvimTreeToggle<cr>", "Explorador de archivos" },

	f = {
		name = "Archivos",
		f = { "<cmd>Telescope find_files<cr>", "Buscar Archivos" },
		g = { "<cmd>Telescope live_grep<cr>", "Buscar texto en los archivos" },
		b = { "<cmd>Telescope buffers<cr>", "Buscar archivos abiertos" },
		h = { "<cmd>Telescope help_tags<cr>", "Documentacion del Editor(neovim)" },
	},
	o = {
		name = "Opciones",
		n = {
			function()
				require("utils").toggle_option("number")
			end,
			"Columna de números",
		},
		l = {
			function()
				require("utils").toggle_statusline()
			end,
			"Barra de estado",
		},
		t = {
			function()
				require("utils").toggle_tabline()
			end,
			"Mostrar barra de pestaña",
		},
		w = {
			function()
				require("utils").toggle_option("wrap")
			end,
			"wrap",
		},
	},

	l = {
		name = "LSP",
		d = { "<cmd>TroubleToggle<cr>", "Problemas Diabnosticados" },
		n = { '<cmd>lua require("nabla").popup()<CR>', "Visualizar Formula" },
	},
	d = {
		name = "Debug",
		b = { "<cmd>DapToggleBreakpoint<cr>", "BreakPoint" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
		O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
		l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
		u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
		x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
		t = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
		f = { "<cmd>lua require('dapui').float_element()<cr>", "Float UI" },
	},
}

local opts_wk = {
	mode = "n", -- NORMAL mode
	-- prefix: use "<leader>f" for example for mapping everything related to finding files
	-- the prefix is prepended to every mapping part of `mappings`
	prefix = "<leader>", -- tecla ESPACIO
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = false, -- use `nowait` when creating keymaps
	expr = false, -- use `expr` when creating keymaps
}

wk.register(mappings, opts_wk)
