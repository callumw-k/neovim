local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

local M = {}
M.setup = function()
  null_ls.setup({
    sources = {
      null_ls.builtins.diagnostics.eslint_d.with({
        diagnostics_format = '[eslint] #{m}\n(#{c})'
      }),
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.code_actions.eslint_d
    },
  })
end
return M
