local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup({
  ensure_installed = { "tsx", "typescript", "javascript", "python", "lua", "css" },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
})
