return {
	"jose-elias-alvarez/null-ls.nvim",
	opts = function()
		local null_ls = require("null-ls")
		return {
			debug = true,
			sources = {
				-- _.builtins.diagnostics.eslint_d.with({
				-- 	diagnostics_format = "[eslint] #{m}\n(#{c})",
				-- }),
				null_ls.builtins.formatting.prettierd.with({
					extra_filetypes = { "svelte" },
				}),
				-- _.builtins.formatting.eslint_d,
				null_ls.builtins.formatting.stylua,
				-- _.builtins.code_actions.eslint_d,
			},
		}
	end,
}
