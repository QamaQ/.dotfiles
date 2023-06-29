return {
    "onsails/lspkind.nvim",
    config = function()
        local icons = require("core.icons")
        require("lspkind").init({
            symbol_map = icons.cmp_kinds,
        })
    end,
}
