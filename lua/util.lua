local M = {}

M.map_key = function (mode, key, action, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, key, action, options)
end

M.is_buffer_empty = function ()
  return vim.fn.empty(vim.fn.expand '%:t') == 1
end

M.has_width_gt = function (cols)
  return vim.fn.winwidth(0) / 2 > cols
end

return M
