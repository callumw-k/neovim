local M = {}

local ok, _ = pcall(require, "cmp_nvim_lsp")
if not ok then
	return
end
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = _.default_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = capabilities

return M
