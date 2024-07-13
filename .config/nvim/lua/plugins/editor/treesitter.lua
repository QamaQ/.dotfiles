local M = {
	 "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
}
function M.config()
  local configs = require("nvim-treesitter.configs")

  configs.setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "python" },
    sync_install = true,
		auto_install = true,
		ignore_install = { "json" },
		modules = {
		},
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return M
