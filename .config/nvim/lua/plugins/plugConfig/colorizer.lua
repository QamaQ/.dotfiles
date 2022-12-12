local status_ok, colorizer = pcall(require, 'colorizer')
if not status_ok then
	return
end

colorizer.setup{
	--'*',
	css = {rbg_fn = true},
	html = { names = false }
}
