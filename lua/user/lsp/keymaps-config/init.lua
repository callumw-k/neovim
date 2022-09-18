local M = {}
local keymap = vim.keymap.set


-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
M.setGlobalLSPKeyMaps = function()
  local opts = { noremap = true, silent = true }
  keymap('n', '<space>e', vim.diagnostic.open_float, opts)
  keymap('n', '[d', vim.diagnostic.goto_prev, opts)
  keymap('n', ']d', vim.diagnostic.goto_next, opts)
  keymap('n', '<space>q', vim.diagnostic.setloclist, opts)
end

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
M.setBufferKeyMaps = function(bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
  keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
  keymap('n', 'K', vim.lsp.buf.hover, bufopts)
  keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
  keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  keymap('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  keymap('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  keymap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  keymap('n', 'gr', vim.lsp.buf.references, bufopts)
  keymap('n', '<space>f', vim.lsp.buf.formatting, bufopts)

end

return M
