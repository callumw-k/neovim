local M = {}

function M.setup()
	local ok, _ = pcall(require, "bufferline")
	if not ok then
		return
	end
	_.setup({
		options = {
			numbers = "none",
			diagnostics = "nvim_lsp",
			separator_style = "slant",
			show_tab_indicators = true,
			show_buffer_close_icons = false,
			show_close_icon = false,
		},
	})
end

return M
