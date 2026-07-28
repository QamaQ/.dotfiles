local M = {}

function M.get()
  local line = vim.fn.line(".")
  local col = vim.fn.col(".")
  return "%#StatusLine# " .. line .. ":" .. col .. " "
end

return M
