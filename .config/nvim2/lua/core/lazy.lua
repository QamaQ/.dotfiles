local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "plugins.ui" },
    { import = "plugins.lsp" },
    { import = "plugins.git" },
    { import = "plugins.explorer" },
    { import = "plugins.util" },
}, {
    install = { colorscheme = { "teide-darker" } },
    ui = {
        icons = {
            ft = "",
            lazy = "󰂠 ",
            loaded = "",
            not_loaded = "",
        },
    },
})
