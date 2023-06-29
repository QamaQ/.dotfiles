return {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "joosepAlviste/nvim-ts-context-commentstring",
            "windwp/nvim-ts-autotag",
        },
    config = function()

local treesitter = require("nvim-treesitter.configs")
treesitter.setup({
    ensure_installed = {
          "css",
          "typescript",
          "bash",
        "html",
        "javascript",
       "json",
        "lua",
      "markdown",
      "markdown_inline",
      "python",
      "query",
      "regex",
      "tsx",
      "typescript",
      "vim",
      "yaml",
    },
    sync_install = true,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },

    context_commentstring = { enable = true },
    autopairs = { enable = true },
    autotag = {
        enable = true,
        enable_rename = true,
        enable_close = true,
        enable_close_on_slash = true,

        filetypes = {
            "html",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "svelte",
            "vue",
            "tsx",
            "jsx",
            "rescript",
            "xml",
            "php",
            "markdown",
            "astro",
            "glimmer",
            "handlebars",
            "hbs",
        },
        skip_tags = {
            "area",
            "base",
            "br",
            "col",
            "command",
            "embed",
            "hr",
            "img",
            "slot",
            "input",
            "keygen",
            "link",
            "meta",
            "param",
            "source",
            "track",
            "wbr",
            "menuitem",
        },
    },
})
    end
}