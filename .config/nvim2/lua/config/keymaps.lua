local map = vim.keymap.set

map("i", "<C-b>", "<ESC>^i", { desc = "Mover al principio de la línea" })
map("i", "<C-e>", "<End>", { desc = "Mover al final de la línea" })
map("i", "<C-h>", "<Left>", { desc = "Mover cursor a la izquierda" })
map("i", "<C-l>", "<Right>", { desc = "Mover cursor a la derecha" })
map("i", "<C-j>", "<Down>", { desc = "Mover cursor abajo" })
map("i", "<C-k>", "<Up>", { desc = "Mover cursor arriba" })

map("n", "<C-h>", "<C-w>h", { desc = "Cambiar a la ventana izquierda" })
map("n", "<C-l>", "<C-w>l", { desc = "Cambiar a la ventana derecha" })
map("n", "<C-j>", "<C-w>j", { desc = "Cambiar a la ventana inferior" })
map("n", "<C-k>", "<C-w>k", { desc = "Cambiar a la ventana superior" })

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Limpiar resaltados de búsqueda" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "Guardar archivo actual" })

map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Alternar números de línea relativos" })

map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "Mostrar lista de diagnósticos LSP" })

map("n", "<leader>/", "gcc", { desc = "Comentar/Descomentar línea (modo normal)" })
map("v", "<leader>/", "gc", { desc = "Comentar/Descomentar selección (modo visual)" })

map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Alternar ventana NvimTree" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Enfocar ventana NvimTree" })

local function snacks_picker(name)
    return function() require("snacks").picker[name]() end
end

map("n", "<leader>fw", snacks_picker("grep"), { desc = "Buscar texto en archivos (live grep)" })
map("n", "<leader>fb", snacks_picker("buffers"), { desc = "Buscar en buffers abiertos" })
map("n", "<leader>fh", snacks_picker("help"), { desc = "Buscar en la documentación de ayuda" })
map("n", "<leader>ma", snacks_picker("marks"), { desc = "Buscar en los marcadores (marks)" })
map("n", "<leader>fo", snacks_picker("recent"), { desc = "Buscar en archivos recientes" })
map("n", "<leader>fz", snacks_picker("lines"), { desc = "Buscar en el buffer actual" })
map("n", "<leader>cm", snacks_picker("git_log"), { desc = "Buscar en commits de Git" })
map("n", "<leader>gt", snacks_picker("git_status"), { desc = "Ver estado de Git" })
map("n", "<leader>pt", snacks_picker("terminals"), { desc = "Buscar en terminales ocultas" })
map("n", "<leader>ff", snacks_picker("files"), { desc = "Buscar archivos" })

map("n", "]b", "<cmd>bnext<CR>", { desc = "Siguiente buffer" })
map("n", "[b", "<cmd>bprev<CR>", { desc = "Anterior buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Cerrar buffer" })
map("n", "<leader>cd", "<cmd>CodeDiff<CR>", { desc = "Ver diff del archivo" })
