local modules = {
  "plugins",
  "core.options",
  "core.keymaps",
}

if vim.g.vscode then
  require "core.options"
  -- require "core.keymaps"
else
  for _, module in ipairs(modules) do
    require(module)
  end
end
