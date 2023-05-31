local status_ok, commets = pcall(require, 'Comment')
if not status_ok then
	return
end

commets.setup()
