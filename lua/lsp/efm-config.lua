local nvim_lsp = require('lspconfig')
local lsp_util = require('lspconfig/util')
local util = require('lsp/util')

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true
}

local prettier = {
  formatCommand = (
    function()
      if not vim.fn.empty(vim.fn.glob(vim.loop.cwd() .. '/.prettierrc')) then
        return "prettier --config ./.prettierrc"
      else
        return "prettier --config ~/.config/nvim/.prettierrc"
      end
    end
  )()
}

nvim_lsp['efm'].setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = true
    util.map_key(bufnr)
  end,
  init_options = {documentFormatting = true},
  filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescript.tsx",
        "typescriptreact",
        "less",
        "scss",
        "css"
  },
  root_dir = lsp_util.root_pattern(".git", vim.fn.getcwd()),
  settings = {
    -- rootMarkers = {vim.loop.cwd()},
    languages = {
      javascript = { eslint, prettier },
      typescript = { eslint, prettier },
      ["javascript.jsx"] = {eslint, prettier},
      ["typescript.tsx"] = {eslint, prettier},
      -- other languages here
    }
  }
}
