return {
	"pmizio/typescript-tools.nvim",
	enabled = true,
	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	config = function()
		require("typescript-tools").setup({
			settings = {
				tsserver_plugins = {
					"@styled/typescript-styled-plugin",
				},
			},
		})
	end,
}
