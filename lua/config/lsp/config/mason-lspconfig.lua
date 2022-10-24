local M = {}
M.setup = function()
	local ok, _ = pcall(require, "mason-lspconfig")
	if not ok then
		return
	end
	_.setup()
end

return M
