local M = {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' }
}

M.init = function()
  local st = require("lualine")
  local mode = {
    'mode',
    fmt = function(str) return "--" .. str .. "--" end
  }

  local filename = {
    'filename',
    file_status = true,    -- Displays file status (readonly status, modified status)
    newfile_status = true, -- Display new file status (new file means no write after created)
    path = 1,              -- 0: Just the filename
    -- 1: Relative path
    -- 2: Absolute path
    -- 3: Absolute path, with tilde as the home directory
    -- 4: Filename and parent dir, with tilde as the home directory

    shorting_target = 40, -- Shortens path to leave 40 spaces in the window
    -- for other components. (terrible name, any suggestions?)
    symbols = {
      modified = '[+]',  -- Text to show when the file is modified.
      readonly = '[-]',  -- Text to show when the file is non-modifiable or readonly.
      unnamed = '',      -- Text to show for unnamed buffers.
      newfile = '[New]', -- Text to show for newly created file before first write
    },
    padding = { left = 0, right = 1 }
  }

  local filetype = {
    'filetype',
    colored = true,             -- Displays filetype icon in color if set to true
    icon_only = true,           -- Display only an icon for filetype
    icon = { align = 'right' }, -- Display filetype icon on the right hand side
    -- fmt = function(str)
    --   return str
    -- end
    -- icon =    {'X', align='right'}
    -- Icon string ^ in table is ignored in filetype component
    padding = { left = 1, right = 0 }
  }



  local opts = {
    options = {
      icons_enabled = true,
      theme = require("themes.lualine_colors"),
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      disabled_filetypes = {
        statusline = {},
        winbar = {},
      },
      ignore_focus = { "nvim-tree" },
      always_divide_middle = true,
      always_show_tabline = true,
      globalstatus = true,
      refresh = {
        statusline = 100,
        tabline = 100,
        winbar = 100,
      }
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'branch', 'diff', filetype, filename, mode },
      lualine_x = { 'diagnostics', 'encoding', 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
  }
  st.setup(opts)
end

return M
