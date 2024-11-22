local prettier_formatting = { "prettierd", "prettier", stop_after_first = true }

local prettier_filetypes = {
	"javascript",
	"typescript",
	"javascriptreact",
	"typescriptreact",
	"svelte",
	"css",
	"html",
	"json",
	"yaml",
	"markdown",
	"graphql",
}

local formatters_by_ft = {
	lua = { "stylua" },
	python = { "isort", "black" },
}

for _, filetype in ipairs(prettier_filetypes) do
	formatters_by_ft[filetype] = prettier_formatting
end

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = {
				lsp_fallback = true,
				timeout_ms = 500,
			},
			formatters_by_ft = formatters_by_ft,
		})
	end,
}
