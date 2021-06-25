local M = {}

M.map_key = function (mode, key, action, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, key, action, options)
end

return M
