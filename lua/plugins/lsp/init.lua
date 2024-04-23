return {
	{
		dependencies = {
			{
				"folke/neodev.nvim",
				opts = {
					setup_jsonls = true,
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

			local lsp_utils = require("defaults.lsp-utils")

			mason_lspconfig.setup({
				handlers = {
					function(server)
						lspconfig[server].setup({
							capabilities = vim.deepcopy(capabilities),
						})
						vim.api.nvim_exec_autocmds("User", { pattern = "LspAttached" })
						lsp_utils.attach_buffer_keymaps()
						lsp_utils.fix_omnisharp()
					end,
					["svelte"] = function()
						lspconfig.svelte.setup({
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
				},
			})
			lspconfig.gleam.setup({})
		end,
	},
}
