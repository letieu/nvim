require"bufferline".setup{
    options = {
        view = "multiwindow",
        numbers = "ordinal",
        number_style = "superscript", -- buffer_id at index 1, ordinal at index 2
        mappings = true, -- Leader + number
        modified_icon = "●",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = true,
        separator_style = "thick",
        offsets = {{filetype = "NvimTree", text = "", text_align = "left"}},
        custom_areas = {
            right = function()
                local result = {}
                local error = vim.lsp.diagnostic.get_count(0, [[Error]])
                local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
                local info = vim.lsp.diagnostic.get_count(0, [[Information]])
                local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

                time = os.date("*t")
                time_display = " " .. time.hour .. ":" .. time.min .. "  "

                result[1] = {text= time_display, guifg = "#BD93F9"}

                if error ~= 0 then
                result[2] = {text = "  " .. error, guifg = "#EC5241"}
                end

                if warning ~= 0 then
                result[3] = {text = "  " .. warning, guifg = "#EFB839"}
                end

                if hint ~= 0 then
                result[4] = {text = "  " .. hint, guifg = "#A3BA5E"}
                end

                if info ~= 0 then
                result[5] = {text = "  " .. info, guifg = "#7EA9A7"}
                end

                return result
            end
        }
    }
}
