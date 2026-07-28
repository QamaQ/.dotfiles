local M = {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "RRethy/nvim-treesitter-endwise",
    },
}

function M.init()
    require("core.keymaps").register({ "<leader>it", "<cmd>TSUpdate<cr>", desc = "Update parsers" })
    require("core.keymaps").register({ "<leader>iT", "<cmd>TSInstall all<cr>", desc = "Install parsers (all)" })

    -- Register md-related filetypes with the md parser
    vim.treesitter.language.register("markdown", "pandoc")
    vim.treesitter.language.register("markdown", "rmd")
    vim.treesitter.language.register("markdown", "quarto")

    -- Custom parser for comments
    vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
            require("nvim-treesitter.parsers").comment = {
                install_info = {
                    url = "https://github.com/OXY2DEV/tree-sitter-comment",
                    queries = "queries/",
                },
            }
        end,
    })
end

function M.config()
    require("nvim-treesitter").setup()
end

return M
