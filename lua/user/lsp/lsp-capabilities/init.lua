local ok, _ = pcall(require, "cmp_nvim_lsp")
if not ok then
  return
end

local M = {}
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = _.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true;

-- Code actions
capabilities.textDocument.codeAction = {
  dynamicRegistration = false;
  codeActionLiteralSupport = {
    codeActionKind = {
      valueSet = {
        "",
        "quickfix",
        "refactor",
        "refactor.extract",
        "refactor.inline",
        "refactor.rewrite",
        "source",
        "source.organizeImports",
      };
    };
  };
}

M.capabilities = capabilities

return M