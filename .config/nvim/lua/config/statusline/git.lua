local M = {}

function M.get()
  local branch = vim.b.gitsigns_head or ""
  if branch == "" then return "" end
  return "%#StatusLine# " .. branch .. " "
end

return M
