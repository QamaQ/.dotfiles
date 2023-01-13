local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")

if not status_ok then
	return
end

treesitter.setup({
	ensure_install = { "lua", "javascript", "html", "python", "yaml", "typescript", "bash", "comment", "vim" },
	sync_install = true,
	highlight = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = false,
		},
	},
	context_commentstring = {
		enable = true,
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
})
