local treesitter = require("nvim-treesitter.configs")
treesitter.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "python" },
  sync_install = true,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
}
