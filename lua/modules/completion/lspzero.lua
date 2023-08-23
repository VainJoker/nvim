local lsp = require('lsp-zero')
lsp.preset({
  manage_nvim_cmp = false,
})
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()
