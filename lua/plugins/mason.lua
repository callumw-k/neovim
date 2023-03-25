local attach_buffer_keymaps = function()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gd", function()
        require("telescope.builtin").lsp_definitions({})
      end, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
      vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
      vim.keymap.set("n", "<space>D", function()
        require("telescope.builtin").lsp_type_definitions({})
      end, opts)
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)

      vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", function()
        require("telescope.builtin").lsp_references({})
      end, opts)
      vim.keymap.set("n", "<space>ff", function()
        vim.lsp.buf.format({ async = true })
      end, opts)
      vim.keymap.set("n", "<space>s", function()
        require("telescope.builtin").lsp_document_symbols({})
      end, opts)
    end,
  })
end

return {
  {
    dependencies = {
      {
        "williamboman/mason.nvim",
        config = true,
      },
      "neovim/nvim-lspconfig",
      "simrat39/rust-tools.nvim",
      "jose-elias-alvarez/typescript.nvim",
    },
    "williamboman/mason-lspconfig.nvim",
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require('lspconfig')
      local capabilities = require("lsp.lsp-capabilities")

      attach_buffer_keymaps()

      mason_lspconfig.setup_handlers({
        function(lsp)
          lspconfig[lsp].setup({
            capabilities = capabilities,
          })
        end,
        ["rust_analyzer"] = function()
          require("rust-tools").setup({
            server = {
              on_attach = function(_, bufnr)
                vim.keymap.set("n", "<C-space>", _.hover_actions.hover_actions, { buffer = bufnr })
                vim.keymap.set("n", "<Leader>a", _.code_action_group.code_action_group, { buffer = bufnr })
              end,
            },
          })
        end,
        ["tsserver"] = function()
          require("typescript").setup({
            disable_commands = false,
            debug = false,
            go_to_source_definition = {
              fallback = true,
            },
            server = {
              capabilities = capabilities,
            },
          })
        end,
        ["eslint"] = function()
          lspconfig.eslint.setup({
            on_attach = function(_, bufnr)
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
              })
            end,
          })
        end,
      })
    end,
  },
}
