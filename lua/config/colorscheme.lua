local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  return
end

local M = {}
M.setup = function()
  onedark.setup {
    style = 'deep'
  }
  onedark.load()
end

return M
