local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
map("n", "n", "nzzzv", { desc = "Next search" })
map("n", "N", "Nzzzv", { desc = "Prev search" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "Guardar archivo actual" })

map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to blackhole" })

map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear highlights" })
map("n", "<C-p>", "<cmd>Telescope find_files<CR>", { desc = "Find files" })

map({ "n", "x" }, "<leader>F", function() vim.lsp.buf.format() end, { desc = "Format" })
