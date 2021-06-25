local nvim_lsp = require('lspconfig')
local util = require('lsp/util')

 nvim_lsp['pyright'].setup {
  on_attach = function(client, bufnr)
     util.map_key(bufnr)
     print("Start python LSP")
  end
}
