local M = {}
M.setup = function()
	local status_ok, onedark = pcall(require, "onedark")
	if not status_ok then
		return
	end
	onedark.setup({
		style = "deep",
	})
	onedark.load()
end

return M
