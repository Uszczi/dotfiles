local telescope = require("telescope.builtin")

local M = {}
M.current_directory = function()
    local cwd = vim.fn.expand("%:p")
    local path = {}

    local i = 0
    for str in string.gmatch(cwd, "[^/]+") do
        path[i] = str
        i = i + 1
    end

    local result = ""
    for index = 0, i - 2 do
        result = result .. "/" .. path[index]
    end

    if result == "" then
        result = vim.fn.getcwd()
    end

    telescope.file_browser({cwd = result})
end

return M
