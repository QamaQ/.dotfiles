local M = {}

function M.get_hl(group, prop)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
  if ok and hl[prop] then return string.format("#%06x", hl[prop]) end
  return nil
end

function M.is_transparent()
  return M.get_hl("Normal", "bg") == nil
end

return M
