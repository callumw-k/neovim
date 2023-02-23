local M = {}

M.setup = function()
	local status_ok, _ = pcall(require, "comment")
	if not status_ok then
		return
	end
	_.setup()
end

return M
