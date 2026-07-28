return {
  'akinsho/toggleterm.nvim',
  version = "*",
  cmd = "ToggleTerm",
  keys = {
    {
      "<c-t>",
      function()
        local Terminal = require("toggleterm.terminal").Terminal
        local term = Terminal:new({ direction = "horizontal" })
        term:open()
      end,
      desc = "Open terminal",
    },
  },
  opts = {
    direction = 'horizontal',
    open_mapping = [[<c-t>]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
    shade_terminals = false,
    winbar = { enabled = false },
    start_in_insert = true,
  }
}
