local api = vim.api

local projects = {
    "~/.config/nvim",
    "-------------------------",
    "~/eway/invoice",
    "~/eway/cpo/src",
    "~/eway/ap/src",
    "~/eway/report/src",
    "-------------------------",
}

local winId

local function startBoard()
    local buf = api.nvim_create_buf(false, true)
    api.nvim_buf_set_lines(buf,0,0,false, projects)
    api.nvim_buf_set_keymap(buf, "n", "<Space>o", "<CMD>lua DB.open()<CR>", {})
    api.nvim_buf_set_keymap(buf, "n", "<Space>`", "<CMD>lua DB.close()<CR>", {})

    winId = api.nvim_open_win(buf, true, {
        relative = 'editor',
        row = 0,
        col = 0,
        width = 30,
        height = 55,
    })
end

local function closeBoard()
    api.nvim_win_close(winId, true)
end

local function openProjectAtLine()
    local path = api.nvim_get_current_line()
    api.nvim_command('cd ' .. path)
    api.nvim_win_close(winId, true)
    vim.cmd('bufdo bd!')
    print('Current at: ' .. api.nvim_call_function('getcwd', {}))
end

DB = {
    start = startBoard,
    open = openProjectAtLine,
    close = closeBoard
}
