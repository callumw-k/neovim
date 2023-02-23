local M = {}

M.setup = function()
	vim.o.winwidth = 10
	vim.o.winminwidth = 10
	vim.o.equalalways = false
	local ok, _ = pcall(require, "windows")
	if not ok then
		return
	end
	_.setup()
end

return M
