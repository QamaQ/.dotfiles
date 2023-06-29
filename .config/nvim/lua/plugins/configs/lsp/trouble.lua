return {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
        local trouble = require("trouble")
        local icons = require("core.icons")
        trouble.setup({
            mode = "document_diagnostics",
            icons = true,
            fold_open = icons.ui.ArrowOpen,
            fold_closed = icons.ui.ArrowClosed,
            indent_lines = icons.ui.lineVertical,
        })
    end,
}
