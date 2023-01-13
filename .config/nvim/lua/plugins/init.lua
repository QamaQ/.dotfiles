local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim..")
	vim.cmd([[ packadd packer.nvim ]])
end

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
		prompt_border = "rounded",
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("nvim-tree/nvim-tree.lua")
	use("nvim-tree/nvim-web-devicons")
	use("yamatsum/nvim-nonicons")
	use("nvim-lualine/lualine.nvim")
	use({ "akinsho/bufferline.nvim", tag = "v3.*" })
	use("goolord/alpha-nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("yamatsum/nvim-cursorline")
	use("rcarriga/nvim-notify")

	-- cmp
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")

	-- lsp
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	use("folke/trouble.nvim")
	use("SmiteshP/nvim-navic")
	--use("ChristianChiarulli/nvim-navic")
	--
	-- For luasnip users.
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

	-- colorschemes
	-- use("marko-cerovac/material.nvim")
	use("QamaQ/material.nvim")
	use("lunarvim/Onedarker.nvim")
	use("folke/tokyonight.nvim")

	--telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")

	use("jose-elias-alvarez/typescript.nvim")

	-- treestitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/nvim-treesitter-context")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("nvim-treesitter/playground")

	-- Commnet
	use("numToStr/Comment.nvim")

	-- gitsigns
	use("lewis6991/gitsigns.nvim")

	if packer_boostrap then
		packer.sync()
	end
end)
