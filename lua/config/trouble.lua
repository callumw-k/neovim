local ok, _ = pcall(require, "trouble")
if not ok then
  return
end

local M = {}

M.setup = function()
  _.setup {}
end

return M
