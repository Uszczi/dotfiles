-- move that to utils
function mysplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end

-- Move that to globals
function P(o)
    print(vim.inspect(o))
    return o
end

local function get_pytest_test_column_line(path, test_name)
    local search_command = "!rg -n " .. test_name .. " " .. path
    local result = vim.api.nvim_exec(search_command, true)
    result = mysplit(result)
    local column = nil
    for k, v in ipairs(result) do
        local s = string.find(v, ":def")
        if s then
            print("ustawiam")
           column = tonumber(mysplit(v, ":")[1])
        end
    end
    P(column)
    return column or 1
end

local function get_path_and_column(line)
    -- 1. PATH same text
    -- 2. same text PATH same text
    -- 3. same text PATH:NUMBER same text
    --
    -- pytest
    -- 4. PATH::test_name same text
    -- 5. same text PATH::test_name same text

    local splited = mysplit(line, ":")
    local path = splited[1]
    path = path:gsub("%s+", "")
    if (path.find('^' .. "/") ~= nil) then
        path = vim.fn.getcwd() .. "/" .. path
    end

    local column = nil
    if splited[2] == nil then
        column = 1
    elseif tonumber(splited[2]) ~= nil then
        column = tonumber(splited[2])
    else
        column = get_pytest_test_column_line(path, splited[2])
    end

    return path, column
end

function GoToFile()
    local line = vim.api.nvim_get_current_line()
    local path, column = get_path_and_column(line)

    -- handle situation from pytest

    local result = vim.uri_to_bufnr("file:/" .. path)
    vim.api.nvim_set_current_buf(result)
    P(path)
    P(column)
    vim.api.nvim_win_set_cursor(0, {column, 1})
end
