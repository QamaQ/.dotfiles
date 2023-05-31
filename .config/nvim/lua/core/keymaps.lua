local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-s>", "<CMD>w<CR>", opts) -- guardar archivo en modo NORMAL
keymap("i", "<C-s>", "<CMD>w<CR>", opts ) -- guardar archivo en modo INSERT

keymap("n", "<C-q>", "<CMD>quit<CR>", opts) -- salir

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

-- keymap("n", "<space>e", "<CMD>NvimTreeToggle<CR>", opts)  --- abrir NvimTree, explorador de archivos(espacio+e)

-- keymap("n", "<space>ff", "<CMD>Telescope find_files<CR>", opts) -- Buscar archivos
-- keymap("n", "<space>fb", "<CMD>Telescope buffers<CR>", opts) -- archivos abiertos

