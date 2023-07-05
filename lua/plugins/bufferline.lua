-- return {
-- 	"akinsho/bufferline.nvim",
-- 	name = "bufferline",
-- 	opts = {
-- 		options = {
-- 			diagnostics = "nvim_lsp",
-- 			show_tab_indicators = true,
-- 			-- show_close_icon = false,
-- 		},
-- 	},
-- }

return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			indicator = {
				style = "underline",
			},
		},
	},
}
