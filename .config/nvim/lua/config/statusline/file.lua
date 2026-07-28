local M = {}

function M.get()
  local name = vim.api.nvim_buf_get_name(0)
  if name == "" then return "%#StatusLine# [No Name] " end

  local icon = ""
  local ok, devicons = pcall(require, "nvim-web-devicons")
  if ok then
    local ext = vim.fn.fnamemodify(name, ":e")
    local ic = devicons.get_icon(name, ext, { default = true })
    if ic then icon = ic .. " " end
  end

  local file = vim.fn.fnamemodify(name, ":t")
  if vim.bo.modified then file = file .. " +" end

  return "%#StatusLine# " .. icon .. file .. " "
end

return M
