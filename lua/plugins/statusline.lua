local galaxyline = require('galaxyline')
local c = require('../colors').colors
local u = require('../util')

local vcs = require('galaxyline.provider_vcs')
local condition = require('galaxyline.condition')
local fileinfo = require('galaxyline.provider_fileinfo')
local extension = require('galaxyline.provider_extensions')
local buffer = require('galaxyline.provider_buffer')
local whitespace = require('galaxyline.provider_whitespace')
local lspclient = require('galaxyline.provider_lsp')

local function in_editor()
    return not(u.is_in_tree())
end


--galaxyline.section.left[1]= {
  --FileSize = {
    --provider = 'FileSize',
    --condition = function()
      --if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        --return true
      --end
      --return false
      --end,
    --icon = '   ',
    --highlight = {c.red,c.bg},
  --}
--}

galaxyline.section.left[1]= {
  git = {
    provider = 'GitBranch',
    condition = u.is_in_tree,
    --icon = '   ',
    highlight = {c.red,c.bg},
  },
}
