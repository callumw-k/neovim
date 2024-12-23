return {
	"saghen/blink.cmp",
	enabled = false,
	version = "v0.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
		active = function(filter)
			if filter and filter.direction then
				return require("luasnip").jumpable(filter.direction)
			end
			return require("luasnip").in_snippet()
		end,
		jump = function(direction)
			require("luasnip").jump(direction)
		end,
	},
	opts = {
		keymap = { preset = "enter" },
	},
	-- allows extending the providers array elsewhere in your config
	-- without having to redefine it
	opts_extend = { "sources.default" },
}
