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
				v = { ":vsplit<cr>", "Split to the right" },
				w = { ":split<cr>", "Split horizontal" },
			},
		}
		which_key.setup(lsp_opts)
		which_key.register(mappings, require("defaults.utils").which_key_opts)
	end,
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
	opts = {
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
		},
	},
}
