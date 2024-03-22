local lsp_zero = require('lsp-zero')
lsp_zero.preset({
  manage_nvim_cmp = false,
})
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'gopls', 'rust_analyzer' },
  handlers = {
    lsp_zero.default_setup,
    rust_analyzer = lsp_zero.noop
  },
})

lsp_zero.on_attach(function(client, bufnr)
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint(bufnr, true)
  end
end)

lsp_zero.set_server_config({
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  },
})

local lua_opts = lsp_zero.nvim_lua_ls()
require('lspconfig').lua_ls.setup(lua_opts)
