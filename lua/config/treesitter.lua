local M = {}

M.setup = function()
  local _ = require("nvim-treesitter.configs")
  _.setup({
    ensure_installed = { "tsx", "typescript", "javascript", "python", "lua", "css" },
    highlight = {
      enable = true, -- false will disable the whole extension
    },
  })
end

return M
