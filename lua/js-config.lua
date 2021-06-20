local nvim_lsp = require('lspconfig')
local util = require('util')

nvim_lsp['tsserver'].setup {
  on_attach = function(client, bufnr)
    util.map_key(bufnr)
    print("Start TS Lsp")
  end
}