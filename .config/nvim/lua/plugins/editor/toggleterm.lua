return {
  {
    "akinsho/toggleterm.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("toggleterm").setup({
        open_mapping = [[<c-\>]],
        shade_filetypes = {},
        direction = "horizontal",
        autochdir = true,
        persist_mode = true,
        insert_mappings = false,
        start_in_insert = true,

        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return math.floor(vim.o.columns * 0.4)
          end
        end,

        on_open = function()
          -- Prevent infinite calls from freezing neovim.
          -- Only set these options specific to this terminal buffer.
          vim.api.nvim_set_option_value("foldmethod", "manual", { scope = "local" })
          vim.api.nvim_set_option_value("foldexpr", "0", { scope = "local" })
        end,
        highlights = {
          Normal = {
            link = "Normal",
          },
          NormalFloat = {
            link = "NormalFloat",
          },
          FloatBorder = {
            link = "FloatBorder",
          },
        },
        hide_numbers = true, -- hide the number column in toggleterm buffers
        -- shade_filetypes = {},
        shade_terminals = true,
        shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
        -- start_in_insert = true,
        -- insert_mappings = true, -- whether or not the open mapping applies in insert mode
        -- persist_size = true,
        -- direction = "horizontal",
        -- close_on_exit = true, -- close the terminal window when the process exits
        -- shell = vim.o.shell, -- change the default shell
        -- winbar = {
        --      enabled = false,
        --      name_formatter = function(term)
        --              return string.format("%d:%s", term.id, term:_display_name())
        --      end,
        -- },
      })
    end,
  },
}
