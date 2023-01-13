local colorscheme = "material"

if colorscheme == "material" then
	require("core.ui.themes.material")

elseif colorscheme == "onedarker" then
	vim.g.onedarker_italic_keywords = false

	vim.g.onedarker_italic_functions = false

	vim.g.onedarker_italic_comments = true

	vim.g.onedarker_italic_loops = true

	vim.g.onedarker_italic_conditionals = true

	local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
	if not status_ok then
		-- vim.notify("colorscheme " .. colorscheme .. " not found!")
		return
	end

elseif colorscheme == "tokyonight" then
  require("core.ui.themes.tokyonight")
end
