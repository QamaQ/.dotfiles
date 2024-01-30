-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Utils = require("lazyvim.util")
local map = Utils.safe_keymap_set

map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Abrir Explorador" })


local builtin = require('telescope.builtin')
map("n", "<leader>ff", builtin.find_files, { desc = "Buscar archivos" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Buscar textos" })
map("n", "<leader>fb", builtin.buffers, { desc = "Pestañas abiertas" })
map("n", "<leader>sh", builtin.help_tags, { desc = "Buscar documentación" })


map("n", "<C-s>", "<cmd>w<cr>", { desc = "Guardar archivo" }) -- Guardar archivo en modo NORMAL
map("i", "<C-s>", "<cmd>w<cr>", { desc = "Guardar archivo" }) -- Guardar archivo en modo INSERT

map("n", "<C-h>", "<C-w>h", {})
map("n", "<C-j>", "<C-w>j", {})
map("n", "<C-k>", "<C-w>k", {})
map("n", "<C-l>", "<C-w>l", {})
map("n", "<C-Up>", "<C-w>k", {})
map("n", "<C-Down>", "<C-w>j", {})
map("n", "<C-Left>", "<C-w>h", {})

map("n", "<C-Right>", "<C-w>l", {})

map("n", "<S-Up>", ":resize -2<CR>", {})
map("n", "<S-Down>", ":resize +2<CR>", {})
map("n", "<S-Left>", ":vertical resize -2<CR>", {})
map("n", "<S-Right>", ":vertical resize +2<CR>", {})
