local M = {}

local map = vim.keymap.set


map({ "n", "x" }, "<leader>F", function() vim.lsp.buf.format() end, { desc = "Format" })

function M.register(mappings)
  local wk_ok, wk = pcall(require, "which-key")

  for _, m in ipairs(mappings) do
    local lhs = m[1]
    local rhs = m[2]
    local desc = m.desc
    local mode = m.mode or "n"

    if wk_ok then
      wk.add({ { lhs, rhs, desc = desc, mode = mode } })
    else
      vim.keymap.set(mode, lhs, rhs, { desc = desc })
    end
  end
end

return M
