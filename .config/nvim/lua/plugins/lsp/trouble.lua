local M = {
  "folke/trouble.nvim"
}

function M.config()
  local trouble = require("trouble")
  local icons = require("plugins.core").opts.icons
  trouble.setup({
    fold_open = icons.misc.ArrowOpen .. " ",
    fold_closed = icons.misc.ArrowClosed .. " ",
    indent_lines = true
  })

  local wk = require("which-key")
  wk.register{
    ["<leader>ld"] = { "<cmd>TroubleToggle<cr>", "Mostrar Problemas" }
  }
end

return M
