local M = {}

M.setup = function()
	local status_ok, _ = pcall(require, "leap")
	if not status_ok then
		return
	end
	_.set_default_keymaps()
end

return M
