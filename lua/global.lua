function tieu()
    print('hehe')
end
--Close a buffer and reopen Nvim tree
function close_tab()
    vim.api.nvim_command('NvimTreeClose')
    vim.api.nvim_command('bdelete')
    vim.api.nvim_command('NvimTreeOpen')
    vim.api.nvim_command('wincmd l')
end
