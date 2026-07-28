local py = require("config.lang.python")

return function(on_attach)
  vim.lsp.config("pyright", {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    on_attach = on_attach,
    settings = {
      python = {
        analysis = {
          useLibraryCodeForTypes = true,
          completeFunctionParens = true,
        },
      },
    },
    on_new_config = function(new_config, new_root_dir)
      py.env(new_root_dir)
      new_config.settings.python.pythonPath = vim.fn.exepath 'python'
      new_config.settings.python.analysis.extraPaths = { py.pep582(new_root_dir) }
    end,
  })

  local function refresh_pyright_env()
    local clients = vim.lsp.get_clients({ name = "pyright" })
    if #clients == 0 then
      vim.notify("No active pyright client", vim.log.levels.WARN)
      return
    end
    local root_dir = clients[1].config.root_dir
    if not root_dir then return end

    py.env(root_dir)

    for _, client in ipairs(clients) do
      client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
        python = {
          pythonPath = vim.fn.exepath 'python',
          analysis = {
            extraPaths = { py.pep582(root_dir) },
          },
        },
      })
      client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
    end
    vim.notify("pyright env refreshed", vim.log.levels.INFO)
  end

  vim.api.nvim_create_user_command("PyrightRefreshEnv", refresh_pyright_env, { desc = "Re-detect Python env and notify pyright" })
end
