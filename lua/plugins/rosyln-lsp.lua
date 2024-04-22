return {
	"jmederosalvarado/roslyn.nvim",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
		require("roslyn").setup({
			dotnet_cmd = "dotnet",
			version = "4.10.0-2.24102.11",
			capabilities = capabilities,
		})
	end,
}
