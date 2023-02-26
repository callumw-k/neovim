return {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
		opts = {
			ensure_installed = { "tsx", "typescript", "javascript", "python", "rust", "lua", "css", "v" },
			auto_install = true,
			highlight = {
				enable = true, -- false will disable the whole extension
			},
			ident = { enable = true },
			rainbow = {
				enable = true,
				extended_mode = true,
				max_file_lines = nil,
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
}
