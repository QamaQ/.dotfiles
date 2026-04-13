local opt = vim.opt

-- Configuración de las teclas "Leader"
-- Estas teclas actúan como prefijos para combinaciones de teclas personalizadas.
vim.g.mapleader = " "       -- La tecla leader se establece como espacio.
vim.g.maplocalleader = "\\" -- La tecla leader local se establece como barra invertida.

-- Configuración general de opciones de Neovim
vim.o.number = true      -- No muestra números de línea absolutos.
vim.o.confirm = true     -- Muestra un diálogo de confirmación para ciertas operaciones.
vim.o.signcolumn = "yes" -- Siempre muestra la columna de signos (para diagnósticos, git, etc.).
-- Sincroniza el portapapeles de Neovim con el del sistema.
-- Si se está en una sesión SSH, se desactiva para evitar problemas.
vim.o.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
vim.opt.fillchars = {
    eob = ' ', -- Carácter de relleno para el final del buffer (evita tildes en líneas vacías).
}

vim.opt.cursorline = false -- No resalta la línea actual del cursor.

-- Configuración de texto e indentación
opt.tabstop = 4        -- Define el tamaño visual de un tabulador a 4 espacios.
opt.shiftwidth = 4     -- Establece el ancho de indentación automática a 4 espacios.
opt.expandtab = true   -- Usa espacios en lugar de tabuladores al presionar 'Tab'.
opt.autoindent = true  -- Copia la indentación de la línea anterior a la nueva.
opt.smartindent = true -- Proporciona indentación inteligente para lenguajes tipo C.
opt.wrap = false       -- Desactiva el ajuste de línea automático para líneas largas.
opt.linebreak = true   -- Si se activa el ajuste de línea, lo corta por palabras.
opt.breakindent = true -- Mantiene la indentación al ajustar líneas largas.
opt.laststatus = 3     -- Establece la barra de estado para que siempre sea global (útil con lualine).
opt.cmdheight = 0
-- Configuración de opciones de completado
-- vim.o.completeopt = 'fuzzy,menu,menuone,popup' -- Define el comportamiento del menú de completado.

-- Bloque de bootstrapping para lazy.nvim (gestor de plugins)
-- Verifica si lazy.nvim está instalado y, si no, lo clona desde GitHub.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- Clona la rama estable más reciente.
        lazypath,
    })
end
-- Agrega la ruta de lazy.nvim al 'runtimepath' de Neovim.
vim.opt.rtp:prepend(lazypath)

-- Configuración de plugins usando lazy.nvim
-- Carga y configura los plugins definidos en el directorio 'lua/plugins'.
require("lazy").setup(
    { import = "plugins" },
    {
        install = { colorscheme = { "material" } },
        ui = {
            icons = {
                ft = "",
                lazy = "󰂠 ",
                loaded = "",
                not_loaded = "",
            },
        },
    }
)

-- Carga las configuraciones de los atajos de teclado
-- Las definiciones de los keymaps se encuentran en 'lua/keymaps.lua'.
require("keymaps")
-- require("autocmd")
