local lsp = Prequire('lsp-zero')
lsp.preset({
    manage_nvim_cmp = false,
})
-- prequire('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()
