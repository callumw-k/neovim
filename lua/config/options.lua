local M = {}
M.setOptions = function()
	local o = vim.opt
	o.fileencoding = "uft-8"
	o.hidden = true
	o.cmdheight = 2
	o.updatetime = 300
	o.hlsearch = false
	o.scrolloff = 8
	o.number = true
	o.splitbelow = true -- force all horizontal splits to go below current window
	o.splitright = true -- force all vertical splits to go to the right of current window
	o.swapfile = false -- creates a swapfile
	o.cursorline = true
	o.incsearch = true
	o.relativenumber = true
	o.smartindent = true
	o.tabstop = 2
	o.softtabstop = 2
	o.shiftwidth = 2
	o.expandtab = true
	o.colorcolumn = "80"
	o.signcolumn = "yes"
end

return M
