local M = {}

M.setup = function()
	local ok, _ = pcall(require, "rust-tools")
	if not ok then
		return
	end
	_.setup({
		server = {
			on_attach = function(_, bufnr)
				-- Hover actions
				require("config.lsp.config.keymaps").setBufferKeyMaps(bufnr)
			end,
		},
	})
end
return M
