return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
  },
  config = function()
    local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
    local dap, dapui = require "dap", require "dapui"
    local icons = require "core.icons"

    dapui.setup {
      icons = {
        collapsed = icons.ui.ArrowClosed,
        current_frame = icons.ui.ArrowClosed,
        expanded = icons.ui.ArrowOpen,
      },
    }
    require("dap-python").setup(path)
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    vim.fn.sign_define(
      "DapBreakpoint",
      { text = icons.ui.Circle, texthl = "DiagnosticSignError", linehl = "", numhl = "" }
    )
  end,
}
