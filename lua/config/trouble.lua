local M = {}

M.setup = function()
	local ok, _ = pcall(require, "trouble")
	if not ok then
		return
	end
	_.setup({})
end

return M
