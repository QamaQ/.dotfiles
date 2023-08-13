local M = {}

M.theme = nil

M.color = require("core.themes.community-material-theme.palette")
-- local color = require("core.themes.community-material-theme.palette")
M.colorschemes = {
	{
		name = "material",
		package = {
			"marko-cerovac/material.nvim",
		},
	},
	{
		name = "onedarkpro",
		package = {
			"olimorris/onedarkpro.nvim",
		},
		setting = function()
			local onedarkpro = require("onedarkpro")
			local themeName = "onedark"
			local colors = require("onedarkpro.helpers").get_colors(themeName)
			onedarkpro.setup()

			vim.cmd("colorscheme " .. themeName)
		end,
	},
}
--

M.packageInstall = function()
	local packages = {}
	for _, packs in ipairs(M.colorschemes) do
		if packs.package then
			for _, package in ipairs(packs.package) do
				table.insert(packages, package)
			end
		end
	end
	return packages
end

M.searchTheme = function()
	for _, themes in ipairs(M.colorschemes) do
		if themes.name == M.theme then
			if themes.setting then
				themes.setting()

				break
			end
		else
			vim.cmd("colorscheme community-material-theme-darker")
		end
	end
end

M.colors = {
	bg = M.color.bg,
	fg = M.color.fg,
	blue = M.color.blue,
	red = M.color.red,
	green = M.color.green,
	yellow = M.color.yellow,
	magenta = M.color.magenta,

	st_fg = M.color.comment,
	st_bg = M.color.bg,

	wb_fg = M.color.comment,
}

-- statusline(lualine)
M.statusline = {
	normal = {
		c = { fg = M.colors.st_fg, bg = M.colors.st_bg },
		x = { fg = M.colors.st_fg, bg = M.colors.st_bg },
	},
	insert = {
		c = { fg = M.colors.st_fg, bg = M.colors.st_bg },
		x = { fg = M.colors.st_fg, bg = M.colors.st_bg },
	},
	visual = {
		c = { fg = M.colors.st_fg, bg = M.colors.st_bg },
		x = { fg = M.colors.st_fg, bg = M.colors.st_bg },
	},
	replace = {
		c = { fg = M.colors.st_fg, bg = M.colors.st_bg },
		x = { fg = M.colors.st_fg, bg = M.colors.st_bg },
	},
	inactive = {
		c = { fg = M.colors.st_fg, bg = M.colors.st_bg },
		x = { fg = M.colors.st_fg, bg = M.colors.st_bg },
	},
}

-- winbar(barbecue-navic)
M.winbar = {
	normal = { fg = M.colors.wb_fg },
	basename = { bold = false },
	ellipsis = { fg = M.colors.wb_fg },
	separator = { fg = M.colors.wb_fg },
	modified = { fg = M.colors.green },
	dirname = { fg = M.colors.wb_fg },
}

-- terminal
M.term = {
	Normal = { link = "Normal" },
	NormalFloat = { link = "Normal" },
	FloatBorder = { link = "Normal" },
}

return M
