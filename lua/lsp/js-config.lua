local nvim_lsp = require('lspconfig')
local util = require('lsp/util')

nvim_lsp['tsserver'].setup {
  on_attach = function(client, bufnr)
    util.map_key(bufnr)
    print("Start TS Lsp")
  end,
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
}

nvim_lsp.vuels.setup{}


