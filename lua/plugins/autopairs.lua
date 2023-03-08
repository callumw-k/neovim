return {
	"windwp/nvim-autopairs",
	opts = function()
		local cmp = require("cmp")

		local cmp_autopairs = require("nvim-autopairs.completion.cmp")

		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

		-- Autopairs
		return {
			check_ts = true,
		}
	end,
}
