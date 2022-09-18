local ok, _ = pcall(require, "mason-lspconfig")
if not ok then
  return
end

local M = {}
M.setup = function()
  _.setup()
end

return M
