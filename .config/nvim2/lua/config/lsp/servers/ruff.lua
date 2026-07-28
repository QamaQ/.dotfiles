local lsp = require("core.lsp")

return {
    name = "ruff",
    config = {
        cmd = { "ruff", "server" },
        filetypes = { "python" },
        root_markers = {
            "pyproject.toml",
            "ruff.toml",
            ".ruff.toml",
            "setup.py",
            ".git",
        },
        on_attach = lsp.on_attach,
        capabilities = lsp.capabilities,
    },
}
