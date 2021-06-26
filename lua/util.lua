local buffer = require('galaxyline.provider_buffer')

local M = {}

M.map_key = function (mode, key, action, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, key, action, options)
end

function M.buffer_is_empty ()
    if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
        return true
    end
    return false
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

function M.is_in_tree()
    return buffer.get_buffer_filetype() == 'NVIMTREE'
end

return M
