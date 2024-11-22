vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

return {
	"anuvyklack/windows.nvim",
	dependencies = {
		"anuvyklack/middleclass",
		"anuvyklack/animation.nvim",
	},
	opts = {},
	keys = {
		{
			"<leader>mp",
			":WindowsMaximize<cr>",
			"Maximise windows",
		},
	},
}
