local M = {}

M.setup = function()
	local status_ok, cmp = pcall(require, "cmp")
	if not status_ok then
		return
	end
	cmp.setup({
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
				-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
				-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
				-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
			end,
		},
		formatting = {
			format = function(entry, vim_item)
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					buffer = "[Buffer]",
					-- luasnip = "[Snip]",
					-- nvim_lua = "[Lua]",
					treesitter = "[Treesitter]",
					path = "[Path]",
				})[entry.source.name]
				return vim_item
			end,
		},
		mapping = cmp.mapping.preset.insert({
			["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
			["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end, { "i", "s" }),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, { "i", "s" }),
		}),
		sources = {
			{ name = "nvim_lsp" },
			{ name = "treesitter" },
			{ name = "nvim_lsp_signature_help" },
			{ name = "nvim_lua" },
			{ name = "buffer" },
			{ name = "path" },
		},
	})

	cmp.setup.cmdline(":", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})

	cmp.setup.cmdline("/", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})

	cmp.setup.cmdline("?", {
		mapping = cmp.mapping.preset.cmdline(),
		sources = {
			{ name = "buffer" },
		},
	})
end

return M
