local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
if not autopairs_ok then
  return
end


local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })


local M = {}

function M.setup()
  -- Autopairs
  autopairs.setup {
    check_ts = true,
  }
end

return M
