
local null_ls_status, null_ls = pcall(require, "null-ls")
if not null_ls_status then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local completion = null_ls.builtins.completion

null_ls.setup({
    debug = false,
    sources = {
        formatting.stylua,
        completion.spell,
        -- diagnostics.eslint,
        -- diagnostics.shellcheck,

        require("typescript.extensions.null-ls.code-actions"),
    }
})
