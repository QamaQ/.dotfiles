local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap


-- Normal --
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
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)


--Save and Close window
keymap("n", "<C-s>", ":w<CR>", {})
keymap("i", "<C-s>", "<Esc>:w<CR>", {})
keymap("n", "<C-w>", ":bdelete<CR>", {})
keymap("n", "<C-q>", ":quit<CR>", {})
--Open explorer
keymap("n", "<C-b>", ":NvimTreeToggle<CR>:NvimTreeRefresh<CR>", opts)

-- Navigate buffers
keymap("n", "<TAB>", ":bnext<CR>", opts)
keymap("n", "<S-TAB>", ":bprevious<CR>", opts)

keymap("n", "<A-Up>", ":m -2<CR>", opts)
keymap("n", "<A-Down>", ":m +1<CR>", opts)



keymap("n", "<leader>f", ":Telescope<CR>", opts)
