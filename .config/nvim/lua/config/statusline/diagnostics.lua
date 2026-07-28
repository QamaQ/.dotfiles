local M = {}

local icons = require("core.icons").diagnostics

function M.get()
  local counts = vim.diagnostic.count(0)
  local result = ""

  if counts[1] and counts[1] > 0 then
    result = result .. " " .. icons.error .. " ".. counts[1]
  end
  if counts[2] and counts[2] > 0 then
    result = result .. " " .. icons.warning .. " " .. counts[2]
  end
  if counts[3] and counts[3] > 0 then
    result = result .. " " .. icons.info .. " " .. counts[3]
  end
  if counts[4] and counts[4] > 0 then
    result = result .. " " .. icons.hint .. " " .. counts[4]
  end

  if result == "" then return "" end
  return "%#StatusLine#" .. result .. " "
end

return M
