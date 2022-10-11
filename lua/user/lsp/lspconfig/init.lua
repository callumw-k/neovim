local keymaps = require("user.lsp.keymaps-config.init")
local capabilities = require("user.lsp.lsp-capabilities.init").capabilities

local lsp_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_ok then
  return
end

local M = {}

keymaps.setGlobalLSPKeyMaps()

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  keymaps.setBufferKeyMaps(bufnr)

  require("user.lsp.autoformatting-config.init").setAutoFormatting(client, bufnr)

  -- if client.name == "tsserver" then
  --   client.resolved_capabilities.document_formatting = false
  --   client.resolved_capabilities.document_range_formatting = false
  -- end

end



M.createServers = function(servers)
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      capabilities = capabilities;
      on_attach = on_attach;
    }
  end
end

return M
