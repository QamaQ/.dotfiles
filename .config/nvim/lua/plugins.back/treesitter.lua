local language = {
    'c', 'vim', 'vimdoc', 'query', 'lua', 'luadoc', 'luap', 'bash', "qmljs",
    'diff', 'regex', 'gitcommit', 'git_config', 'git_rebase', 'markdown', 'markdown_inline',
    'css', 'python', 'html', 'javascript', 'norg', 'scss', 'svelte', 'tsx', 'typst', 'vue'
}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        -- branch = "master",
        -- event = { "BufReadPost", "BufNewFile", "BufRead" },
        -- cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        lazy = false,
        config = function()
            local ts = require("nvim-treesitter")
            for _, parser in ipairs(language) do
                pcall(ts.install, parser)
            end

            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
}
