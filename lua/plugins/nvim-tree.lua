return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function(_, opts)
		require("nvim-tree").setup(opts)
	end,
}
