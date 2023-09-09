return {
	"epwalsh/obsidian.nvim",
	opts = function()
		return {
			dir = "~/Documents/my-notes-v2",
			notes_subdir = "cards",
			daily_notes = {
				folder = "journal",
			},
			completion = {
				nvim_cmp = true,
				new_notes_location = "~/Documents/my-notes-v2/cards",
			},
			disable_frontmatter = true,
			templates = {
				subdir = "templates",
			},
		}
	end,
}
