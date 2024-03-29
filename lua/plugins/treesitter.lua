return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"callumw-k/nvim-ts-autotag",
		"nvim-treesitter/nvim-treesitter-context",
	},
	opts = {
		highlight = {
			enable = true,
		},
		autotag = {
			enable = true,
		},
		indent = { enable = true },
		-- ensure_installed = { "tsx", "typescript", "javascript", "python", "rust", "lua", "css", "regex" },
		auto_install = true,
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
