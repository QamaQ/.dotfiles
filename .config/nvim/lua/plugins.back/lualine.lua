-- Configuración del componente 'filename' para lualine
local filename = {
    'filename',
    file_status = true,    -- Muestra el estado del archivo (solo lectura, modificado)
    newfile_status = true, -- Muestra el estado de archivo nuevo (sin guardar después de crear)
    path = 1,              -- Nivel de ruta a mostrar: 0: Solo nombre, 1: Ruta relativa, 2: Ruta absoluta, 3: Ruta absoluta con ~ para HOME, 4: Nombre y carpeta padre con ~
    shorting_target = 40,  -- Acorta la ruta para dejar 40 espacios disponibles para otros componentes
    symbols = {
        -- modified = icons.misc.circule, -- Símbolo para archivo modificado (comentado)
        readonly = '[-]',             -- Símbolo para archivo de solo lectura
        unnamed = '',                 -- Símbolo para buffers sin nombre
        newfile = '[New]',            -- Símbolo para archivos nuevos antes de guardar
    },
    padding = { left = 0, right = 1 } -- Relleno alrededor del componente
}

-- Configuración del componente 'filetype' para lualine
local filetype = {
    'filetype',
    colored = true,             -- Muestra el icono del tipo de archivo con color
    icon_only = true,           -- Muestra solo el icono del tipo de archivo
    icon = { align = 'right' }, -- Alinea el icono a la derecha
    -- fmt = function(str)       -- Función de formateo (comentada)
    --   return str
    -- end
    -- icon =    {'X', align='right'} -- Icono específico (comentado, la tabla de iconos es ignorada)
    padding = { left = 1, right = 0 } -- Relleno alrededor del componente
}

-- Opciones principales de configuración para lualine
local opts = {
    options = {
        theme = 'auto',                                   -- Tema de lualine, 'auto' para usar el tema actual de Neovim
        component_separators = { left = '', right = '' }, -- Separadores entre componentes (vacíos para un look limpio)
        section_separators = { left = '', right = '' },   -- Separadores entre secciones (vacíos)
        ignore_focus = { "nvim-tree" },                   -- Ignora el foco para el buffer de nvim-tree
        always_divide_middle = true,                      -- Siempre divide el medio de la barra de estado
        always_show_tabline = true,                       -- Siempre muestra la línea de pestañas
        globalstatus = true,                              -- Muestra la barra de estado global en todas las ventanas
        refresh = {                                       -- Frecuencia de refresco para diferentes partes de la UI
            statusline = 100,                             -- Refresca la barra de estado cada 100ms
            tabline = 100,                                -- Refresca la línea de pestañas cada 100ms
            winbar = 100,                                 -- Refresca la barra de la ventana cada 100ms
        }
    },
    sections = {                                              -- Definición de las secciones de lualine (izquierda, centro, derecha)
        lualine_a = { 'mode' },                               -- Sección A (izquierda extrema): Muestra el modo actual (NORMAL, INSERT, etc.)
        lualine_b = { 'branch', 'diff', filetype, filename }, -- Sección B (izquierda): Muestra rama de Git, diferencias, tipo de archivo y nombre de archivo
        lualine_c = {},                                       -- Sección C (centro-izquierda): Vacía
        lualine_x = {

            'diagnostics', 'encoding' }, -- Sección X (centro-derecha): Muestra diagnósticos LSP y codificación del archivo
        lualine_y = {},                  -- Sección Y (derecha): Vacía
        lualine_z = { 'location' }       -- Sección Z (derecha extrema): Muestra la ubicación actual en el archivo (línea:columna, porcentaje)
    },
}

return {
    'nvim-lualine/lualine.nvim',                      -- Define el plugin lualine
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- Dependencia para mostrar iconos (nvim-web-devicons)
    lazy = false,                                     -- Carga el plugin al inicio de Neovim
    config = function()                               -- Función de configuración
        local st = require("lualine")                 -- Requiere el módulo lualine
        st.setup(opts)                                -- Aplica las opciones de configuración definidas
    end
}
