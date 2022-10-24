local M = {}

M.setup = function()
	local status_ok, _ = pcall(require, "null-ls")
	if not status_ok then
		return
	end
	_.setup({
		sources = {
			_.builtins.diagnostics.eslint_d.with({
				diagnostics_format = "[eslint] #{m}\n(#{c})",
			}),
			_.builtins.formatting.prettierd,
			_.builtins.formatting.stylua,
			_.builtins.code_actions.eslint_d,
		},
	})
end

return M
