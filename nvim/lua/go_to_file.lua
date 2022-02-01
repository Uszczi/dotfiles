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

    local cursor = vim.api.nvim_win_get_cursor(0)
    local splited_line = mysplit(line)

    local path_and_maybe_column
    local current_end = 0
    for k, v in ipairs(splited_line) do
        current_end = current_end + #v + 1
       if  current_end > cursor[2] then
           path_and_maybe_column = v
           break
       end
    end

    local splited = mysplit(path_and_maybe_column, ":")
    local path = splited[1]
    path = path:gsub("%s+", "")

    P(path)
    if (string.find(path, '"') ~= nil) then
        path = string.match(path, '".*"')
        path = string.sub(path, 2,2) .. string.sub(path, 3, -2)
        print("znalazlem ''")
        path = path:gsub("%s+", "")
        P(path)
    end

    P(path)
    if (string.find(path, '^' .. "/") == nil) then
    P(path)
        if string.find(line, "get_payload") == nil then
            path = vim.fn.getcwd() .. "/" .. path
        else
            path = "/home/mat/roc/cat-app/tests/fixtures/data/" .. path
        end
    end
    P(path)

    local maybe_column = splited[2]
    local column = nil
    if maybe_column == nil then
        column = 1
    elseif tonumber(maybe_column) ~= nil then
        column = tonumber(splited[2])
    else
        column = get_pytest_test_column_line(path, splited[2])
    end
    P(column)

    return path, column
end

function GoToFile()
    local line = vim.api.nvim_get_current_line()
    local path, column = get_path_and_column(line)

    -- handle situation from pytest

    local result = vim.uri_to_bufnr("file:/" .. path)
    vim.api.nvim_set_current_buf(result)
    vim.api.nvim_win_set_cursor(0, {column, 1})
end
