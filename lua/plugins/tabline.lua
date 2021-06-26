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

                time = os.date("*t")
                time_display = " " .. time.hour .. ":" .. time.min .. "  "
                result[1] = {text= time_display, guifg = "#BD93F9"}

                return result
            end
        }
    }
}
