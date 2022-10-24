local M = {}
M.setup = function()
	local ok, _ = pcall(require, "mason-lspconfig")
	if not ok then
		return
	end
	_.setup({
		"sumneko_lua",
		"rust_analyzer",
		"typescript-language-server",
		"tailwindcss",
		"codelldb",
		"stylua",
		"cssls",
	})
end

return M
