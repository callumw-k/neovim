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
			vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", opts)
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
			{ "folke/neodev.nvim", config = true },
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"simrat39/rust-tools.nvim",
			"jose-elias-alvarez/typescript.nvim",
		},
		"neovim/nvim-lspconfig",
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities(
				vim.lsp.protocol.make_client_capabilities()
			)

			mason_lspconfig.setup()
			mason_lspconfig.setup_handlers({
				function(server)
					attach_buffer_keymaps()
					lspconfig[server].setup({
						capabilities = vim.deepcopy(capabilities),
					})
				end,
				["rust_analyzer"] = function()
					require("rust-tools").setup({
						server = {
							on_attach = function(_, bufnr)
								vim.keymap.set("n", "<C-space>", _.hover_actions.hover_actions, { buffer = bufnr })
								vim.keymap.set(
									"n",
									"<Leader>a",
									_.code_action_group.code_action_group,
									{ buffer = bufnr }
								)
							end,
						},
					})
				end,
				["denols"] = function()
					lspconfig.denols.setup({
						root_dir = lspconfig.util.root_pattern("deno.json"),
						capabilities = vim.deepcopy(capabilities),
					})
				end,
				["tsserver"] = function()
					require("typescript").setup({
						server = {
							root_dir = lspconfig.util.root_pattern("package.json"),
							capabilities = vim.deepcopy(capabilities),
							single_file_support = false,
						},
					})
				end,
				["eslint"] = function()
					lspconfig.eslint.setup({
						capabilities = vim.deepcopy(capabilities),
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
