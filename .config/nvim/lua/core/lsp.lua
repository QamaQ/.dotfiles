vim.lsp.enable({
  "pyright",
  "lua_ls"
})


-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     vim.lsp.start({
--       name = "pyright",
--       cmd = { "pyright-langserver", "--stdio" },
--       root_dir = vim.fn.getcwd(),
--     })
--   end,
-- })
--

-- Archivo: ~/.config/nvim/init.lua

vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.lsp.start({
      name = "pyright",
      cmd = { "pyright-langserver", "--stdio" },
      root_dir = vim.fs.dirname(vim.fs.find({ "pyproject.toml", "setup.py", ".git" }, { upward = true })[1]),
      filetypes = { "python" },
    })
  end,
})

vim.diagnostic.config({
  virtual_lines = true,
  update_in_insert = true,

})
