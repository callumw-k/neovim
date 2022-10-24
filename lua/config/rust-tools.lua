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
				vim.keymap.set("n", "<C-space>", _.hover_actions.hover_actions, { buffer = bufnr })
				-- Code action groups
				vim.keymap.set("n", "<Leader>a", _.code_action_group.code_action_group, { buffer = bufnr })
			end,
		},
	})
end
return M
