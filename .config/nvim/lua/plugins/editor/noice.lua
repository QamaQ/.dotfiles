local M = {
  "folke/noice.nvim",
  event = "VeryLazy",
}

M.opts = {
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
        },
      },
      --view = "mini",
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
    inc_rename = true,
  },
}
M.dependencies = {
  -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  "MunifTanjim/nui.nvim",
  -- OPTIONAL:
  --   `nvim-notify` is only needed, if you want to use the notification view.
  --   If not available, we use `mini` as the fallback
  "rcarriga/nvim-notify",
}

return M
