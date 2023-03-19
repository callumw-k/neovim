local M = {}

local ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not ok then
	return
end
local workspace_capabilities = {
	workspace = {
		didChangeWatchedFiles = {
			dynamicRegistration = true,
		},
	},
}
-- Add additional capabilities supported by nvim-cmp
local default_capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities = vim.tbl_deep_extend("keep", workspace_capabilities, default_capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = capabilities

return M
