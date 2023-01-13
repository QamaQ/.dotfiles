local status_ok, ts_context = pcall(require, "treesitter-context")
if not status_ok then
	return
end

ts_context.setup{
	enable = false
}


