return {
	"folke/which-key.nvim",
	config = function(_, lsp_opts)
		local which_key = require("which-key")

		local mappings = {
			["w"] = { "<cmd>update!<CR>", "Save" },
			["q"] = { "<cmd>q!<CR>", "Quit" },

			b = {
				name = "Buffer",
				d = { "<cmd>bd!<cr>", "Close current buffer" },
				D = { "<cmd>%bd<cr>", "Delete all buffers" },
			},
			f = {
				n = { ":NvimTreeToggle<cr>", "Toggle NvimTree" },
			},
			c = {
				name = "Code Actions",
				c = { ":cclose<cr>", "Close CodeAction" },
			},
			g = {
				name = "Git",
				s = { "<cmd>Neogit<CR>", "Status" },
			},
			s = {
				v = { ":vsplit new<cr>", "Split empty to the right" },
			},
		}
		which_key.setup(lsp_opts)
		which_key.register(mappings, require("defaults.utils").which_key_opts)
	end,
	opts = {
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
		},
	},
}
