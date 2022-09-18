local ok, _ = pcall(require, "impatient")
if not ok then
  return
end

require("user.options")
require("user.plugins")
require("user.telescope")
require("user.keymaps")
require("user.cmp")
require("user.lsp")
require('user.null-ls')
require("user.treesitter")
require('user.colorscheme')
require('user.misc')
