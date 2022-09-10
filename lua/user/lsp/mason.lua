local status_ok, mason = pcall(require, "mason")
if not status_ok then
    return
end
local status_ok, lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

mason.setup()
lspconfig.setup()
