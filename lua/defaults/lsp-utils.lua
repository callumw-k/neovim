local M = {}

M.attach_buffer_keymaps = function()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "gd", function()
				require("telescope.builtin").lsp_definitions({})
			end, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			-- vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
			-- vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
			-- vim.keymap.set("n", "<space>wl", function()
			-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			-- end, opts)
			vim.keymap.set("n", "<space>D", function()
				require("telescope.builtin").lsp_type_definitions({})
			end, opts)
			vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)

			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
			vim.keymap.set("n", "gr", "<cmd>TroubleToggle lsp_references<cr>", opts)
			vim.keymap.set("n", "<space>ff", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
			vim.keymap.set("n", "<space>s", function()
				require("telescope.builtin").lsp_document_symbols({})
			end, opts)
		end,
	})
end

M.fix_omnisharp = function()
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(ev)
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			local function toSnakeCase(str)
				return string.gsub(str, "%s*[- ]%s*", "_")
			end

			if client.name == "omnisharp" then
				local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
				for i, v in ipairs(tokenModifiers) do
					tokenModifiers[i] = toSnakeCase(v)
				end
				local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
				for i, v in ipairs(tokenTypes) do
					tokenTypes[i] = toSnakeCase(v)
				end
			end
		end,
	})
end

return M
