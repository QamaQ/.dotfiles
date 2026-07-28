return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "Format" },
  opts = {
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format", "ruff_organize_imports" },
      rust = { "rustfmt" },
      go = { "gofmt" },
      sh = { "shfmt" },
      markdown = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      yaml = { "prettierd", "prettier" },
    },
  },
}
