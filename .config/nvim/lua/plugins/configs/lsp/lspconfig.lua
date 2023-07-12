return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neodev.nvim" },
    {
      "williamboman/mason.nvim",
      build = ":MasonUpdate",
      -- opts = {
      --   ensure_installed = {
      --     "stylua",
      --     -- "shellcheck",
      --     -- "flake8",
      --     "shfmt",
      --     "mypy",
      --     "ruff",
      --     "black",
      --     "debugpy",
      --   },
      -- },
    },
    "williamboman/mason-lspconfig.nvim",
    "jay-babu/mason-null-ls.nvim",
    "b0o/schemastore.nvim",
  },
  config = function()
    -- Setup language servers.
    local lspconfig = require "lspconfig"
    local mason = require "mason"
    local mason_lspconfig = require "mason-lspconfig"
    local mason_null_ls = require "mason-null-ls"
    local neodev = require "neodev"
    local utils = require "core.utils"
    mason.setup {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    }
    mason_lspconfig.setup {
      ensure_installed = utils.language_servers,
      automatic_installation = true,
    }
    mason_null_ls.setup {
      ensure_installed = {
        "prettier",
        "stylua",
        -- "eslind_d",
        "mypy",
        "ruff",
        "black",
        "debugpy",
      },
    }
    neodev.setup {
      library = { plugins = { "nvim-dap-ui" }, types = true },
    }
    -- Enable some language servers with the additional completion capabilities offered by nvim-cmp
    local servers = utils.language_servers

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = utils.capabilities,
      }
    end

    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace",
          },
          -- diagnostics = {
          --     globals = { "vim" },
          -- },
          telemetry = {
            enable = false,
          },
          format = {
            enable = false,
          },
          hint = {
            enable = true,
            arrayIndex = "Disable", -- "Enable", "Auto", "Disable"
            await = true,
            paramName = "All", -- "All", "Literal", "Disable"
            paramType = true,
            semicolon = "Disable", -- "All", "SameLine", "Disable"
            setType = true,
          },
          diagnostics = {
            globals = { "P" },
          },
          workspace = {
            checkThirdParty = false,
          },
        },
      },
    }

    lspconfig.ltex.setup {
      settings = {
        ltex = {
          language = { "es", "en" },
        },
      },
    }

    lspconfig.jsonls.setup {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    }
    lspconfig.yamlls.setup {
      settings = {
        yaml = {
          schemaStore = {
            -- You must disable built-in schemaStore support if you want to use
            -- this plugin and its advanced options like `ignore`.
            enable = false,
          },
          schemas = require("schemastore").yaml.schemas(),
        },
      },
    }
  end,
}
