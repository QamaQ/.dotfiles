local map = vim.keymap.set

-- Keymaps para el modo de inserción (Insert Mode)
-- Estos atajos permiten movimientos básicos del cursor sin salir del modo de inserción.
map("i", "<C-b>", "<ESC>^i", { desc = "Mover al principio de la línea" }) -- Ctrl+b: Mover al principio de la línea
map("i", "<C-e>", "<End>", { desc = "Mover al final de la línea" })       -- Ctrl+e: Mover al final de la línea
map("i", "<C-h>", "<Left>", { desc = "Mover cursor a la izquierda" })     -- Ctrl+h: Mover cursor a la izquierda
map("i", "<C-l>", "<Right>", { desc = "Mover cursor a la derecha" })      -- Ctrl+l: Mover cursor a la derecha
map("i", "<C-j>", "<Down>", { desc = "Mover cursor abajo" })              -- Ctrl+j: Mover cursor abajo
map("i", "<C-k>", "<Up>", { desc = "Mover cursor arriba" })               -- Ctrl+k: Mover cursor arriba

-- Keymaps para el modo normal (Normal Mode) - Gestión de ventanas
-- Estos atajos permiten cambiar entre ventanas divididas.
map("n", "<C-h>", "<C-w>h", { desc = "Cambiar a la ventana izquierda" }) -- Ctrl+h: Cambiar a la ventana izquierda
map("n", "<C-l>", "<C-w>l", { desc = "Cambiar a la ventana derecha" })   -- Ctrl+l: Cambiar a la ventana derecha
map("n", "<C-j>", "<C-w>j", { desc = "Cambiar a la ventana inferior" })  -- Ctrl+j: Cambiar a la ventana inferior
map("n", "<C-k>", "<C-w>k", { desc = "Cambiar a la ventana superior" })  -- Ctrl+k: Cambiar a la ventana superior

-- Keymaps generales para el modo normal
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Limpiar resaltados de búsqueda" }) -- Esc: Limpiar resaltados de búsqueda
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Guardar archivo actual" })           -- Ctrl+s: Guardar archivo

-- Keymaps para toggles de configuración
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Alternar números de línea relativos" }) -- <Leader>rn: Alternar números de línea relativos
map("n", "<leader>ch", "<cmd>NvCheatsheet<CR>", { desc = "Abrir/Cerrar NvCheatsheet" })       -- <Leader>ch: Abrir/Cerrar NvCheatsheet

-- Keymaps para el Protocolo del Servidor de Lenguaje (LSP)
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "Mostrar lista de diagnósticos LSP" }) -- <Leader>ds: Mostrar lista de diagnósticos LSP

-- Keymaps para comentar código
map("n", "<leader>/", "gcc", { desc = "Comentar/Descomentar línea (modo normal)" })    -- <Leader>/ : Comentar/Descomentar la línea actual
map("v", "<leader>/", "gc", { desc = "Comentar/Descomentar selección (modo visual)" }) -- <Leader>/ : Comentar/Descomentar la selección

-- Keymaps para NvimTree (explorador de archivos)
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Alternar ventana NvimTree" })   -- Ctrl+n: Alternar la visibilidad del árbol de archivos
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Enfocar ventana NvimTree" }) -- <Leader>e: Enfocar el árbol de archivos si está abierto

-- Keymaps para Telescope (buscador difuso)
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "Buscar texto en archivos (live grep)" })       -- <Leader>fw: Búsqueda interactiva de texto
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buscar en buffers abiertos" })                   -- <Leader>fb: Buscar entre los buffers abiertos
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Buscar en la documentación de ayuda" })        -- <Leader>fh: Buscar en la ayuda de Neovim
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "Buscar en los marcadores (marks)" })               -- <Leader>ma: Buscar marcadores definidos
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "Buscar en archivos recientes" })                -- <Leader>fo: Abrir archivos recientes
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "Buscar en el buffer actual" }) -- <Leader>fz: Búsqueda difusa en el buffer actual
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "Buscar en commits de Git" })                 -- <Leader>cm: Ver y buscar en el historial de commits
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "Ver estado de Git" })                         -- <Leader>gt: Mostrar estado de los archivos en Git
map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "Buscar en terminales ocultas" })                   -- <Leader>pt: Buscar entre las terminales ocultas
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Buscar archivos" })                           -- <Leader>ff: Búsqueda difusa de archivos


local M = {}

function M.register(mappings)
	local present, which_key = pcall(require, "which-key")

	if present then
		which_key.add(mappings)
	end
end

return M
