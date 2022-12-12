local opts = { noremap = true, silent = true }
local vim = vim
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key

keymap("", "<Space>", "<Nop>", opts)


-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)
-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>",  opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)
--Save and Close window
keymap("n", "<C-s>", ":w<CR>", {})
keymap("i", "<C-s>", "<Esc>:w<CR>", {})
keymap("n", "<C-w>", ":bdelete<CR>", {})
keymap("n", "<C-q>", ":quit<CR>", {})


keymap("n", "x", '"_x', opts)


--Open explorer
-- keymap("n", "<Space>e", ":NvimTreeToggle<CR>:NvimTreeRefresh<CR>", opts)
