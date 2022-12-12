local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
	return
end

bufferline.setup {
	options = {
		show_close_icon = false,
		mode = "buffers",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer", -- | function ,
				text_align = 'center', -- "left" | "center" | "right"
				separator = false
			}
		},
		hover = {
			enabled = true,
			delay = 200,
			reveal = { 'close' }
		},
		indicator = {
			icon = '▎',
			style = 'underline'
		},
		diagnostics = 'nvim_lsp'
	}
}
