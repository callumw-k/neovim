local M = {}

M.setup = function()
	local ok, _ = pcall(require, "which-key")
	if not ok then
		return
	end

	local builtin = require("telescope.builtin")
	local conf = {
		window = {
			border = "single", -- none, single, double, shadow
			position = "bottom", -- bottom, top
		},
	}

	local opts = {
		mode = "n", -- Normal mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = false, -- use `nowait` when creating keymaps
	}

	local mappings = {
		["w"] = { "<cmd>update!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },

		b = {
			name = "Buffer",
			d = { "<cmd>bd!<cr>", "Close current buffer" },
			D = { "<cmd>%bd<cr>", "Delete all buffers" },
		},

		z = {
			name = "Packer",
			c = { "<cmd>PackerCompile<cr>", "Compile" },
			i = { "<cmd>PackerInstall<cr>", "Install" },
			s = { "<cmd>PackerSync<cr>", "Sync" },
			S = { "<cmd>PackerStatus<cr>", "Status" },
			u = { "<cmd>PackerUpdate<cr>", "Update" },
		},
		f = {
			name = "File Explorers",
			n = { ":NvimTreeToggle<cr>", "Toggle NvimTree" },
			p = {
				function()
					builtin.find_files()
				end,
				"Find Files",
			},
		},
		c = {
			name = "Code Actions",
			c = { ":cclose<cr>", "Close CodeAction" },
		},
		g = {
			name = "Git",
			s = { "<cmd>Neogit<CR>", "Status" },
		},
	}

	_.setup(conf)
	_.register(mappings, opts)
end

return M
