local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  return
end
vim.opt.termguicolors = true
vim.opt.syntax = "ON"
onedark.load()
