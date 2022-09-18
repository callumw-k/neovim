local ok, _ = pcall(require, "mason")
if not ok then
  return
end

local M = {}

function M.setup()
  _.setup()
end

return M
