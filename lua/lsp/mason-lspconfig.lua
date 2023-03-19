local M = {}
M.setup = function()
	local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
	if not ok then
		return
	end
	local m = ""

	local lsp_ok, lspconfig = pcall(require, "lspconfig")
	if not lsp_ok then
		return
	end

	local keymaps = require("lsp.keymaps")

	local capabilities = require("lsp.lsp-capabilities").capabilities

	local on_attach = function(client, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		keymaps.setBufferKeyMaps(bufnr)

		require("lsp.autoformatting").setFormatOnSave(client, bufnr)
	end

	require("neodev").setup()

	mason_lspconfig.setup()

	-- vim.diagnostic.config({
	-- 	virtual_text = false,
	-- 	signs = true,
	-- 	float = {
	-- 		border = "single",
	-- 		format = function(diagnostic)
	-- 			return string.format(
	-- 				"%s (%s) [%s]",
	-- 				diagnostic.message,
	-- 				diagnostic.source,
	-- 				diagnostic.code or diagnostic.user_data.lsp.code
	-- 			)
	-- 		end,
	-- 	},
	-- })

	mason_lspconfig.setup_handlers({
		function(lsp)
			lspconfig[lsp].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end,
		["rust_analyzer"] = function()
			require("rust-tools").setup()
		end,
		["tsserver"] = function()
			require("typescript").setup({
				disable_commands = false, -- prevent the plugin from creating Vim commands
				debug = false, -- enable debug logging for commands
				go_to_source_definition = {
					fallback = true, -- fall back to standard LSP definition on failure
				},
				server = { -- pass options to lspconfig's setup method
					--					init_options = {
					--						preferences = {
					--							importModuleSpecifier = "relative",
					--						},
					--					},
					capabilities = capabilities,
					on_attach = on_attach,
				},
			})
		end,
		["eslint"] = function()
			lspconfig.eslint.setup({
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})
		end,
	})
end

return M
