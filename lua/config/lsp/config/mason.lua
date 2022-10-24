local M = {}

function M.setup()
	local ok, _ = pcall(require, "mason")
	if not ok then
		return
	end
	_.setup()
end

return M
