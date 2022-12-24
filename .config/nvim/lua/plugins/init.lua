local fn = vim.fn

local ensure_packer = function()
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	-- snapshot = "july-24",
	max_jobs = 50,
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded", -- Border style of prompt popups.
	},
	working_sym = "ﱤ",
})

local packer_bootstrap = ensure_packer()

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use({ "goolord/alpha-nvim" })

	-- lsp
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("folke/trouble.nvim")
	use("RRethy/vim-illuminate")
	use("SmiteshP/nvim-navic")
	use("lvimuser/lsp-inlayhints.nvim")
	use("metakirby5/codi.vim")
	-- cmp
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("L3MON4D3/LuaSnip")
	use("hrsh7th/cmp-emoji")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	use({ "nvim-tree/nvim-tree.lua" })
	use({ "nvim-tree/nvim-web-devicons" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "akinsho/bufferline.nvim", tag = "v3.*" })

	use("olimorris/onedarkpro.nvim") -- Packer
	-- If you are using Packer
	use("marko-cerovac/material.nvim")

	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "kylechui/nvim-surround" })
	use({ "nvim-treesitter/nvim-treesitter-textobjects" })
	use({ "nvim-treesitter/playground" })

	use("lukas-reineke/indent-blankline.nvim")

	use({ "lewis6991/gitsigns.nvim" })

	use({ "norcalli/nvim-colorizer.lua" })

	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })

	use({ "nvim-lua/plenary.nvim" })

	use({ "folke/which-key.nvim" })

	use({ "jose-elias-alvarez/typescript.nvim" })

	use({ "akinsho/toggleterm.nvim" })
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require("packer").sync()
	end
end)
