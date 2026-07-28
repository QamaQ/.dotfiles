return {
    "serhez/teide.nvim",
    priority = 1000,
    config = function()
        require("teide").setup({ style = "darker" })
        vim.cmd([[colorscheme teide-darker]])
    end,
}
