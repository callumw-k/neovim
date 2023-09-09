return {
	{
		dependencies = {
			{
				"folke/neodev.nvim",
				opts = {
					setup_jsonls = false,
				},
			},
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"simrat39/rust-tools.nvim",
		},
		"neovim/nvim-lspconfig",
		config = function()
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			require("neodev").setup()
			mason_lspconfig.setup()
			mason_lspconfig.setup_handlers({
				function(server)
					lspconfig[server].setup({
						capabilities = vim.deepcopy(capabilities),
					})
					require("defaults.lsp-utils").attach_buffer_keymaps()
					require("defaults.lsp-utils").fix_omnisharp()
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
