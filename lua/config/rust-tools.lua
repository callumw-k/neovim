local M = {}


M.setup = function()
  local _ = require("rust-tools")
  _.setup({
    server = {
      on_attach = function(_, bufnr)
        -- Hover actions
        require('config.lsp.config.keymaps').setBufferKeyMaps(bufnr)
      end,
    },
  })
end
return M
