return {
	"kelly-lin/ranger.nvim",
	enabled = false,

	config = function()
		require("ranger-nvim").setup({ replace_netrw = true })

		local mappings = {
			p = {
				v = {
					function()
						require("ranger").open(true)
					end,
					"Open file explorer",
				},
			},
		}
		require("defaults.utils").which_key_register(mappings)
	end,
}
