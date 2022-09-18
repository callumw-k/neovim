local servers = { "tailwindcss", "sumneko_lua", "tsserver" }

require("user.lsp.mason-config.init").setup()
require("user.lsp.mason-lsp-config.init").setup()
require("user.lsp.lspconfig.init").createServers(servers)
