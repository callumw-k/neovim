return {
	{
		enabled = false,
		"echasnovski/mini.indentscope",
		version = "*",
		config = function()
			require("mini.indentscope").setup({
				symbol = "|",
			})
		end,
	},
}
