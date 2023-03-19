return {
	"windwp/nvim-autopairs",
	opts = function()
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		local cmp = require("cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		-- Autopairs
		return {
			check_ts = true,
		}
	end,
}
