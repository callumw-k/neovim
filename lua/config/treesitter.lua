local M = {}

M.setup = function()
	local ok, _ = pcall(require, "nvim-treesitter.configs")
	if not ok then
		return
	end
	_.setup({
		ensure_installed = { "tsx", "typescript", "javascript", "python", "rust", "lua", "css" },
		auto_install = true,
		highlight = {
			enable = true, -- false will disable the whole extension
		},
		ident = { enable = true },
		rainbow = {
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		},
	})
end

return M
