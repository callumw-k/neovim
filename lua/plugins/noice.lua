return {
	{
		"rcarriga/nvim-notify",
		enabled = false,
		opts = {
			render = "wrapped-compact",
			max_width = 50,
			timeout = 1500,
		},
	},
	{
		"folke/noice.nvim",
		enabled = true,
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
	},
}
