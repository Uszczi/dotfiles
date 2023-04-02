require "uszczi.set"
require "uszczi.lazy"

require "uszczi.remap"
require "uszczi.globals"

local hex_to_char = function(x)
    return string.char(tonumber(x, 16))
end

local unescape = function(url)
    return url:gsub("%%(%x%x)", hex_to_char)
end

local function print_selected_text()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", false)

    local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
    local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))

    if cecol > 10000 then
        local text = vim.api.nvim_buf_get_text(0, csrow - 1, cscol - 1, cerow - 1, cecol - 1, {})
        text = unescape(text[1])
        vim.api.nvim_buf_set_lines(0, csrow - 1, csrow, false, {text})
    else
        local text = vim.api.nvim_buf_get_text(0, csrow - 1, cscol - 1, cerow - 1, cecol, {})
        text = unescape(text[1])
        vim.api.nvim_buf_set_text(0, csrow - 1, cscol - 1, cerow - 1, cecol, {text})
    end
end

vim.keymap.set(
    {"n", "v"},
    "<leader>ru",
    function()
        print_selected_text()
    end,
    {silent = false}
)
