local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap
--keymap("n", "<space>e", "<cmd>NvimTreeToggle<cr>", opts)   -- Abrir explorador de archivos(tecla ESPACIO+e )
keymap("i", "<C-b>", "<cmd>NvimTreeFocus<cr>", opts) -- Enfocar explorador de archivos en modo INSERT
keymap("n", "<C-b>", "<cmd>NvimTreeFocus<cr>", opts) -- Enfocar explorador de archivos en modo NORMAL

keymap("n", "<C-s>", "<cmd>w<cr>", opts) -- Guardar archivo en modo NORMAL
-- keymap("i", "<C-s>", "<cmd>w<cr>", opts)             -- Guardar archivo en modo INSERT

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

-- buffers Navigators
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

local status_wk, wk = pcall(require, "which-key")
if not status_wk then
  return
end

local mappings = {
  -- splits
  s = {
    name = "splits",
    v = { "<C-w>v", "Split vertical" },
    h = { "<C-x>x", "Split horizontal" },
    e = { "<C-w>=", "Restablecer el split" },
    x = { "<cmd>Close<cr>", "Cerrar split" },
  },

  -- Pestañas
  t = {
    name = "Pestañas",
    x = { "<cmd>bdelete<cr>", "Cerrar pestañas" },
    n = { "<cmd>tabn<cr>", "Next tab" },
    p = { "<cmd>tabp<cr>", "previous tab" },

    t = { "<cmd>ToggleTerm<cR>", "Terminal Horizontal" },
  },

  -- e = { "<cmd>NvimTreeToggle<cr>", "Explorador de Archivos" },
  e = {
    name = "Explorador",
    -- e = { "<cmd>Neotree toggle left<cr>", "Explorador de archivos" },
    -- a = { "<cmd>Neotree reveal left<cr>", "Enfocar explorador" },
    e = { "<cmd>NvimTreeToggle<cr>", "Explorador de archivos" },
    a = { "<cmd>NvimTreeFocus<cr>", "Enfocar explorador" },
  },

  f = {
    name = "Archivos",
    f = { "<cmd>Telescope find_files<cr>", "Buscar Archivos" },
    g = { "<cmd>Telescope live_grep<cr>", "Buscar texto en los archivos" },
    b = { "<cmd>Telescope buffers<cr>", "Buscar archivos abiertos" },
    h = { "<cmd>Telescope help_tags<cr>", "Documentacion del Editor(neovim)" },
  },
  o = {
    name = "Opciones",
    n = { '<cmd>lua require("core.autocommands").toggle_option("number")<cr>', "Columna de números" },
    l = { '<cmd>lua require("core.autocommands").toggle_statusline()<cr>', "Barra de estado" },
    t = { '<cmd>lua require("core.autocommands").toggle_tabline()<cr>', "Mostrar barra de pestaña" },
    w = { '<cmd>lua require("core.autocommands").toggle_option("wrap")<cr>', "wrap" },
  },

  c = {
    name = "Codi",
    d = { "<cmd>Codi<cr><cmd>Codi!<cr><cmd>CodiUpdate<cr>", "Ejecutar Codi" },
    c = { "<cmd>Codi!<cr>", "Cerrar Codi" },
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
