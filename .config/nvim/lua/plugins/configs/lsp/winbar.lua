local winbar = require("barbecue")
local icons = require("core.icons")
local colors = require("material.colors")

winbar.setup({
  attach_navic = true,
  create_autocmd = true,
  exclude_filetypes = { "netrw", "toggleterm", "telescope" },
  show_modified = true,
  -- modified = function(bufnr) return vim.bo[bufnr].modified end,
  symbols = {
    modified = icons.ui.Circle,
    separator = icons.ui.ArrowClosed,
  },
  theme = {
    normal = { fg = colors.syntax.comments, bold = false },
    basename = { bold = false }
  },
  kinds = icons.cmp_kinds

})
