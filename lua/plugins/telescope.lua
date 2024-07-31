return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		dependencies = {
			{ "nvim-lua/plenary.nvim", "folke/which-key.nvim" },
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local builtin = require("telescope.builtin")

			local mappings = {
				f = {
					b = {
						function()
							builtin.buffers()
						end,
						"Search open buffers",
					},
					g = {
						function()
							builtin.live_grep()
						end,
						"Search string",
					},
					m = {
						function()
							builtin.marks()
						end,
						"Find marks",
					},
					r = {
						function()
							builtin.lsp_references()
						end,
						"Find references",
					},
					s = {
						function()
							builtin.lsp_document_symbols()
						end,
						"Search the current LSP symbols",
					},
				},
				b = {
					s = {
						function()
							builtin.current_buffer_fuzzy_find()
						end,
						"Search current buffer",
					},
				},
			}
			if require("defaults.utils").is_windows() then
				mappings.f.p = {
					function()
						builtin.find_files()
					end,
					"Fuzzy search files",
				}
			end

			require("defaults.utils").which_key_register(mappings)
			telescope.setup(opts)
		end,
		opts = function()
			local actions = require("telescope.actions")
			return {
				defaults = {
					file_ignore_patterns = { "node_modules" },
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
						},
					},
				},
				pickers = {
					marks = {
						theme = "dropdown",
					},
				},
			}
		end,
	},
}
