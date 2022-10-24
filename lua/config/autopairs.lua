local M = {}

M.setup = function()
	local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
	if not autopairs_ok then
		return
	end

	local cmp_ok, cmp = pcall(require, "cmp")
	if not cmp_ok then
		return
	end

	local cmp_autopairs = require("nvim-autopairs.completion.cmp")

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

	-- Autopairs
	autopairs.setup({
		check_ts = true,
	})
end

return M
