local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local user = augroup("user", { clear = true })

autocmd("TextYankPost", {
  group = user,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
  desc = "Resalta brevemente el texto yandeado",
})

autocmd("BufReadPost", {
  group = user,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Vuelve a la última posición al abrir un archivo",
})

autocmd("BufWritePre", {
  group = user,
  callback = function(event)
    local path = event.file
    vim.fn.mkdir(vim.fn.fnamemodify(path, ":p:h"), "p")
  end,
  desc = "Crea directorios padres automáticamente al guardar",
})


