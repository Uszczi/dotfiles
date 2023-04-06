local term = require("harpoon.term")

local function getBufferText()
    return vim.api.nvim_buf_get_lines(0, 0, -1, false)
end

local function filterText(text)
    local filtered = {}

    for i, part in ipairs(text) do
        if part ~= "" then
            table.insert(filtered, part)
        else
            if text[i + 1] == "" then
                table.insert(filtered, part)
            end
        end
    end

    return filtered
end

local function getSelectedText()
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", false)
    local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
    local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))

    local text
    if cecol > 10000 then
        text = vim.api.nvim_buf_get_text(0, csrow - 1, cscol - 1, cerow - 1, cecol - 1, {})
    else
        text = vim.api.nvim_buf_get_text(0, csrow - 1, cscol - 1, cerow - 1, cecol, {})
    end

    return text, csrow, cscol, cerow, cecol
end

local function sendToTerminalSelection(idx)
    local text = getSelectedText()
    text = filterText(text)
    term.sendCommand(idx, table.concat(text, "\n") .. "\n\n")
end

local function sendToTerminalBuffer(idx)
    local text = getBufferText()
    term.sendCommand(idx, table.concat(text, "\n") .. "\n\n")
end

vim.keymap.set(
    {"n", "v"},
    "<leader>rp",
    function()
        sendToTerminalSelection(2)
    end,
    {silent = false}
)

vim.keymap.set(
    {"n", "v"},
    "<leader>rP",
    function()
        sendToTerminalBuffer(2)
    end,
    {silent = false}
)
