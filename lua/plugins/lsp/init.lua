local group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true })
local test = "empy"

vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", function()
			require("telescope.builtin").lsp_definitions({})
		end, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)

		-- vim.keymap.set("n", "<leader>e", vim.lsp.diagnostic.show_line_diagnostics, opts)
		vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)

		vim.keymap.set("n", "<space>D", function()
			require("telescope.builtin").lsp_type_definitions({})
		end, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)

		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
	end,
})

return {
	{ "williamboman/mason.nvim", config = true },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function(_, opts)
			local mason_lspconfig = require("mason-lspconfig")
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local lspconfig = require("lspconfig")

			mason_lspconfig.setup(opts)
			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = cmp_nvim_lsp.default_capabilities(),
					})
				end,
				-- lua_ls = function()
				-- 	lspconfig.lua_ls.setup({
				-- 		on_init = function(client)
				-- 			if client.workspace_folders then
				-- 				local path = client.workspace_folders[1].name
				-- 				if
				-- 					vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc")
				-- 				then
				-- 					return
				-- 				end
				-- 			end
				--
				-- 			client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
				-- 				runtime = {
				-- 					version = "LuaJIT",
				-- 				},
				-- 				workspace = {
				-- 					checkThirdParty = false,
				-- 					library = {
				-- 						vim.env.VIMRUNTIME,
				-- 					},
				-- 				},
				-- 			})
				-- 		end,
				-- 		settings = {
				-- 			Lua = {},
				-- 		},
				-- 	})
				-- end,
			})
		end,
		opts = {},
	},
	"neovim/nvim-lspconfig",
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{ "Bilal2453/luvit-meta", lazy = true },
	{
		"hrsh7th/nvim-cmp",
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0,
			})
		end,
	},
}
