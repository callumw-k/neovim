return {
	"epwalsh/obsidian.nvim",
  enabled = false,
	opts = function()
		return {
			dir = "~/Documents/notes/Notes",
			completion = {
				nvim_cmp = true,
			},
		}
	end,
}
