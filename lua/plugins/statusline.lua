---@diagnostic disable: unused-local
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

local function is_in_editor()
    return not(u.is_in_tree())
end


galaxyline.section.left[1]= {
    gitBranch = {
        provider = 'GitBranch',
        condition = u.is_in_tree,
        icon = '  ',
        highlight = {c.cyan,c.bg},
    },
    getDiffAdd = {
        provider = 'DiffAdd',
        condition = u.is_in_tree,
        highlight = {c.red,c.bg},
    }
}

-- LSP
galaxyline.section.left[2] = {
    error = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {c.red,c.bg},
    },
    warn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {c.orange,c.bg},
    },
    hint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {c.cyan,c.bg},
    },
    info = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {c.green,c.bg},
    },
}

galaxyline.section.right[1] = {
    file = {
        provider = 'FileName',
        icon = '  ',
        condition = is_in_editor,
        highlight = {c.pink,c.bg},
    }
}
