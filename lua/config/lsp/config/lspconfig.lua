local M = {}

M.createServers = function(servers)
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

	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
	end
end

return M
