local eslint_d_filetypes = {
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
	"svelte",
}

return {
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lint = require("lint")
			local helpers = require("config.helpers")
			lint.linters_by_ft = {
				python = { "pylint" },
			}

			local has_package_json = helpers.if_file_exist("package.json")
			local has_eslint = has_package_json and helpers.if_file_exist("eslint*")

			if has_eslint then
				for _, ft in ipairs(eslint_d_filetypes) do
					lint.linters_by_ft[ft] = { "eslint" }
				end
			end

			local lint_group = vim.api.nvim_create_augroup("lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePre", "InsertLeave" }, {
				group = lint_group,
				callback = function()
					lint.try_lint()
				end,
			})
		end,
	},
}
