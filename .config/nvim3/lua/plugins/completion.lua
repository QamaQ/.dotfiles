return {
  "saghen/blink.cmp",
  version = "1.*",
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },

    appearance = {
      kind_icons = require("core.icons.kinds"),
    },

    completion = {
      documentation = {
        auto_show = false,
        auto_show_delay_ms = 500,
      },
      ghost_text = { enabled = false },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
      menu = {
        draw = {
          align_to = "cursor",
          columns = {
            { "kind_icon" },
            { "label", gap = 0 },
          },
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                return ctx.kind_icon
              end,
              highlight = function(ctx)
                return { { group = ctx.kind_hl, priority = 10000 } }
              end,
            },
          },
        },
      },
    },

    signature = { enabled = true },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
