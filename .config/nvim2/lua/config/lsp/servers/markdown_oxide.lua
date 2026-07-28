local lsp = require("core.lsp")

return {
  name = "markdown_oxide",
  config = {
    cmd = { "markdown-oxide" },
    filetypes = { "markdown" },
    root_markers = { ".git", ".obsidian", ".moxide.toml" },
    on_attach = lsp.on_attach,
    capabilities = lsp.capabilities,
  },
}
