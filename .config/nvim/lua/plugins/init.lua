local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("plugins.configs.nvimtree")
    end,
  },
  "nvim-tree/nvim-web-devicons",

  -- autocompletados: cmp, lsp, mason, snippets
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lsp.lspconfig")
      require("plugins.configs.lsp.handlers")
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function ()
      require("plugins.configs.lsp.masonconfis")
    end
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    config = function()
      require("plugins.configs.lsp.mason")
    end,
  },
  {
    'j-hui/fidget.nvim',
    config = function ()
      require("plugins.configs.lsp.fidget")
    end
  },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    config = function ()
      require("plugins.configs.lsp.winbar")
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- autompletados
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      {
        "windwp/nvim-autopairs",
        config = function()
          require("plugins.configs.autopairs")
        end,
      },
      -- snippet
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      {
        "folke/trouble.nvim",
        config = function()
          require("plugins.configs.lsp.trouble")
        end,
      },
      {
        "onsails/lspkind.nvim",
        config = function()
          require("plugins.configs.lsp.lspkind")
        end,
      },
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require("plugins.configs.lsp.null-ls")
        end,
      },
    },

    config = function()
      require("plugins.configs.lsp.cmp")
    end,
  },

  -- themes
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("core.themes.material")
    end,
  },
  -- Lazy
  {
    "olimorris/onedarkpro.nvim",
    priority = 1000 -- Ensure it loads first
  },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("plugins.configs.telescope")
    end,
  },

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("plugins.configs.treesitter")
    end,
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("plugins.configs.which-key")
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("plugins.configs.comments")
    end,
  },
}

require("lazy").setup(plugins)
