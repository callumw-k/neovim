local M = {}

function M.setup()

  local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
  if not autopairs_ok then
    return
  end
  -- Autopairs
  autopairs.setup {
    check_ts = true,
  }

end

return M
