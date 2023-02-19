local M = {}
M.setup = function()
	local ok, mason_lspconfig = pcall(require, "mason-lspconfig")
	if not ok then
		return
	end

	local lsp_ok, lspconfig = pcall(require, "lspconfig")
	if not lsp_ok then
		return
	end

	local keymaps = require("config.lsp.config.keymaps")

	local capabilities = require("config.lsp.config.lsp-capabilities").capabilities

	local on_attach = function(client, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		keymaps.setBufferKeyMaps(bufnr)

		require("config.lsp.config.autoformatting").setFormatOnSave(client, bufnr)
	end

	mason_lspconfig.setup()

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
	})
end

return M
