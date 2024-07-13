
local Utils = require("lazyvim.util")
local map = Utils.safe_keymap_set
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", {})

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


local status_wk, wk = pcall(require, "which-key")
if not status_wk then
  return
end

wk.register({
  ["<leader>on"] = { '<cmd>lua require("config.autocmds").toggle_option("number")<cr>', "Mostrar columna de números" },
  ["<leader>ol"] = { '<cmd>lua require("config.autocmds").toggle_statusline()<cr>', "Alterar barra de estado" },
})
