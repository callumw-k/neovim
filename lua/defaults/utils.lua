local M = {}
local which_key_opts = {
  mode = "n",    -- Normal mode
  prefix = "<leader>",
  buffer = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}
M.detect_os = function()
  local system_info = vim.loop.os_uname()
  if system_info.sysname:match("Windows") then
    return "Windows"
  elseif system_info.sysname:match("Darwin") then
    return "Mac"
  else
    return "Unknown"
  end
end

M.is_windows = function()
  return M.detect_os() == "Windows"
end

M.is_mac = function()
  return M.detect_os() == "Mac"
end

M.which_key_opts = which_key_opts

M.which_key_register = function(mappings)
  require("which-key").register(mappings, which_key_opts)
end

return M
