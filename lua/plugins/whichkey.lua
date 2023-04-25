return {
  "folke/which-key.nvim",
  config = function(_, lsp_opts)

    local which_key = require("which-key")

    local builtin = require("telescope.builtin")

    local opts = {
      mode = "n",  -- Normal mode
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
        s = {
          function()
            builtin.current_buffer_fuzzy_find()
          end,
          "Search current buffer",
        },
      },
      f = {
        n = { ":NvimTreeToggle<cr>", "Toggle NvimTree" },
        b = {
          function()
            builtin.buffers()
          end,
          "Search open buffers",
        },
        p = {
          function()
            builtin.find_files()
          end,
          "Fuzzy search files",
        },
      },
      m = {
        p = {
          ":WindowsMaximize<cr>",
          "Maximise Window",
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
	which_key.setup(lsp_opts)
	which_key.register(mappings, opts)
  end,
  opts = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  },
}
