local M = {}

M.setup = function()
	local ok, _ = pcall(require, "treesitter-context")
	if not ok then
		return
	end
	_.setup()
end

return M
