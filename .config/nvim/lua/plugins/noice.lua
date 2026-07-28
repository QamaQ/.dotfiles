local M = {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  event = "UIEnter",
  cond = not vim.g.started_by_firenvim and not vim.g.vscode,
}

function M.init()
  require("core.keymaps").register({ "<leader>kn", "<cmd>Noice<cr>", desc = "Notifications" })
end

function M.config()
  local icons = require("core.icons")

  require("noice").setup({
    health = {
      checker = false,
    },

    cmdline = {
      view = "cmdline",
      format = {
        cmdline = { icon = " " .. icons.arrow.right_short_thick },
        search_down = { icon = " " .. icons.lupa .. " " .. icons.arrow.double_down_short },
        search_up = { icon = " " .. icons.lupa .. " " .. icons.arrow.double_up_short },
        filter = { icon = " " .. icons.filter },
        lua = { icon = " " .. icons.language.lua },
        help = { icon = " " .. icons.question },
      },
    },

    views = {
      hover = {
        border = {
          style = "solid",
          padding = { 0, 0 },
        },
        position = { row = 0, col = 0 },
      },
      mini = {
        timeout = 4000,
        win_options = {
          winblend = 0,
        },
        winhighlight = {},
      },
    },

    notify = {
      enabled = true,
      view = "mini",
    },

    messages = {
      enabled = true,
      view = false,
      view_error = "mini",
      view_warn = "mini",
      view_history = "messages",
      view_search = "virtualtext",
    },

    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      message = {
        enabled = true,
        view = "mini",
      },
      hover = {
        enabled = true,
        silent = true,
      },
      signature = {
        enabled = false,
      },
      documentation = {
        view = "hover",
        opts = {
          lang = "markdown",
          replace = true,
          render = "plain",
          format = { "{message}" },
          win_options = {
            concealcursor = "n",
            conceallevel = 3,
          },
        },
      },
    },

    routes = {
      {
        view = "confirm",
        filter = {
          any = {
            { event = "msg_show", kind = "confirm" },
            { event = "msg_show", kind = { "echo", "echomsg", "" }, before = true },
            { event = "msg_show", kind = { "echo", "echomsg" },     instant = true },
          },
        },
      },
      {
        view = "cmdline",
        filter = {
          any = {
            { event = "msg_show", kind = "confirm_sub" },
          },
        },
      },
      {
        view = "split",
        filter = { event = "msg_show", min_height = 5 },
      },
    },
  })

  vim.treesitter.language.register("markdown", "noice")
end

return M
