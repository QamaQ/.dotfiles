local M = {
  'saghen/blink.cmp',
  -- version = "1.*",
  opts_extend = { "sources.default" },
  init = function()
    require("blink.cmp").setup({

      appearance = {
        use_nvim_cmp_as_default = true,
        kind_icons = require("core.icons").kind
      },
      keymap = {
        preset = 'none',
        ['<C-e>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<S-Tab>'] = { 'select_prev', 'fallback' },
        ['<Tab>'] = { 'select_next', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
      },
      sources = {
        default = { "lsp", "buffer" },
      },
      completion = {
        menu = {
          scrollbar = false,
          draw = {
            align_to = 'cursor',
            -- columns = {
            --   { "kind_icon" },
            --   { "label" },
            --   { "kind" },
            --   { "source_name" },
            -- },
          },
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = false
          }
        }
      },

      fuzzy = { implementation = "lua" },
    })
  end
}


return M
