return {
	"goolord/alpha-nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		local startify = require("alpha.themes.startify")
		require("alpha").setup(startify.config)
	end,
}
