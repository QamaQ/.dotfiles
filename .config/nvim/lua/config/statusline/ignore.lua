local M = {}

local ignored_filetype = { "neo-tree", "trouble", "lazy", "mason", "help" }
local ignored_buftype = { "terminal", "help" }

function M.should_ignore()
  local ft = vim.bo.filetype
  local bt = vim.bo.buftype
  for _, v in ipairs(ignored_filetype) do if ft == v then return true end end
  for _, v in ipairs(ignored_buftype) do if bt == v then return true end end
  return false
end

return M
