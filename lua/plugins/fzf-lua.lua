return {
	"ibhagwan/fzf-lua",
	enabled = function()
		if require("defaults.utils").is_windows() then
			return false
		end
		return true
	end,
	dependencies = { "nvim-tree/nvim-web-devicons", "folke/which-key.nvim" },
	config = function()
		local mappings = {
			f = {
				p = {
					function()
						require("fzf-lua").files()
					end,
					"Fuzzy search files",
				},
			},
		}
		require("defaults.utils").which_key_register(mappings)
		require("fzf-lua").setup({ "telescope" })
	end,
}
