local M = {}

function M.register(mappings)
	local present, which_key = pcall(require, "which-key")

	if present then
		which_key.add(mappings)
	end
end

return M
