local M = {}

local icons = require("core.icons").git

function M.get()
  local ok, gitsigns = pcall(require, "gitsigns")
  if not ok then return "" end

  local diff = gitsigns.get_hunks()
  if not diff then return "" end

  local result = ""
  for _, hunk in ipairs(diff) do
    if hunk.added and hunk.added.count > 0 then
      result = result .. " +" .. hunk.added.count
    end
    if hunk.removed and hunk.removed.count > 0 then
      result = result .. " -" .. hunk.removed.count
    end
  end

  if result == "" then return "" end
  return "%#StatusLine#" .. result .. " "
end

return M
