local lspconfig = require'lspconfig'
local util = require'lsp/util'

lspconfig.ccls.setup {
  init_options = {
    cache = {
      directory = ".ccls-cache";
    };
  },
  on_attach = function(client, bufnr)
     util.map_key(bufnr)
     print("Start CCLS LSP")
  end
}
