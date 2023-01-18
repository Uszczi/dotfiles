local api = vim.api

local function prune_nil(items)
    return vim.tbl_filter(function(x) return x end, items)
end

local function starts_with(str, start) return str:sub(1, #start) == start end

local function get_nodes(query_text, predicate)
    local end_row = api.nvim_win_get_cursor(0)[1]
    local ft = api.nvim_buf_get_option(0, "filetype")
    assert(ft == "python",
           "test_method of dap-python only works for python files, not " .. ft)
    local query = vim.treesitter.parse_query(ft, query_text)
    assert(query, "Could not parse treesitter query. Cannot find test")
    local parser = vim.treesitter.get_parser(0)
    local root = (parser:parse()[1]):root()
    local nodes = {}
    for _, node in query:iter_captures(root, 0, 0, end_row) do
        if predicate(node) then table.insert(nodes, node) end
    end
    return nodes
end

local function get_function_nodes()
    local query_text = [[
    (function_definition
      name: (identifier) @name) @definition.function
  ]]
    return get_nodes(query_text,
                     function(node) return node:type() == "identifier" end)
end

local function get_node_text(node)
    local row1, col1, row2, col2 = node:range()
    if row1 == row2 then row2 = row2 + 1 end
    local lines = api.nvim_buf_get_lines(0, row1, row2, true)
    if #lines == 1 then return (lines[1]):sub(col1 + 1, col2) end
    return table.concat(lines, "\n")
end

local function get_parent_classname(node)
    local parent = node:parent()
    while parent do
        local type = parent:type()
        if type == "class_definition" then
            for child in parent:iter_children() do
                if child:type() == "identifier" then
                    return get_node_text(child)
                end
            end
        end
        parent = parent:parent()
    end
end

local function closest_above_cursor(nodes)
    local result
    for _, node in pairs(nodes) do
        if not result then
            result = node
        else
            local node_row1, _, _, _ = node:range()
            local result_row1, _, _, _ = result:range()
            local text = get_node_text(node)

            if node_row1 > result_row1 then
                if starts_with(text, "test_") then result = node end
            end
        end
    end
    return result
end

local M = {}

function M.visit_last()
    if M.last_file then
        api.nvim_command("e " .. M.last_file)
    else
        api.nvim_command("TestVisit")
    end
end

function M.last_test()
    if M.last_command then
        M.call_command(M.last_command.command, M.last_command.name)
    else
        vim.api.nvim_command("TestNearest")
    end
end

function M.call_command(command, name)
    vim.api.nvim_command("tabnew")
    vim.api.nvim_command("TabooRename " .. name)

    command = "call termopen('" .. command .. "')"
    vim.api.nvim_command(command)
    vim.api.nvim_buf_set_keymap(0, "n", "q", ":q<CR>", {})
end

function M.is_registered_directory(pwd)
    local finded = false
    for _, value in pairs(M.opts.registered_directory) do
        if value == pwd then finded = true end
    end
    return finded
end

function M.test_method()
    local pwd = vim.fn.getcwd()

    if not M.is_registered_directory(pwd) then
        vim.api.nvim_command("TestNearest")
        return
    end

    local function_node = closest_above_cursor(get_function_nodes())
    if not function_node then
        M.last_test()
        return
    end

    local class = get_parent_classname(function_node)
    local function_name = get_node_text(function_node)
    local path = vim.fn.expand("%:p")
    M.last_file = path

    path = string.gsub(path, pwd .. "/", "")
    local test_path =
        table.concat(prune_nil({path, class, function_name}), "::")

    local command
    for _, value in ipairs(M.opts.testing_commands) do
        command = value(test_path)
        if command then break end
    end

    if command == nil then
        M.last_test()
        return
    end

    M.last_command = {command = command, name = function_name}
    M.call_command(command, function_name)
end

function M.debug_method()
    local pwd = vim.fn.getcwd()

    if not M.is_registered_directory(pwd) then
        require("dap-python").test_method()
        return
    end

    local function_node = closest_above_cursor(get_function_nodes())
    if not function_node then
        M.last_test()
        return
    end

    local class = get_parent_classname(function_node)
    local function_name = get_node_text(function_node)
    local path = vim.fn.expand("%:p")
    M.last_file = path

    path = string.gsub(path, pwd .. "/", "")
    local test_path =
        table.concat(prune_nil({path, class, function_name}), "::")

    local command
    for _, value in ipairs(M.opts.debug_commands) do
        command = value(test_path)
        if command then break end
    end
    if command == nil then
        M.last_test()
        return
    end

    M.last_command = {command = command, name = function_name}
    M.call_command(command, function_name)
end

function M.test_file()
    local pwd = vim.fn.getcwd()

    if not M.is_registered_directory(pwd) then
        vim.api.nvim_command("TestFile")
        return
    end

    local path = vim.fn.expand("%:p")
    M.last_file = path
    path = string.gsub(path, pwd .. "/", "")

    local command
    for _, value in ipairs(M.opts.testing_commands) do
        command = value(path)
        if command then break end
    end

    if command == nil then
        M.last_test()
        return
    end

    M.last_command = {command = command, name = vim.fn.executable("%:t")}
    M.call_command(command, vim.fn.executable("%:t"))
end

function M.test_debug_file()
    local pwd = vim.fn.getcwd()

    if not M.is_registered_directory(pwd) then
        vim.api.nvim_command("TestFile")
        return
    end

    local path = vim.fn.expand("%:p")
    M.last_file = path
    path = string.gsub(path, pwd .. "/", "")

    local command
    for _, value in ipairs(M.opts.testing_commands) do
        command = value(path)
        if command then break end
    end

    if command == nil then
        M.last_test()
        return
    end

    M.last_command = {command = command, name = vim.fn.executable("%:t")}
    M.call_command(command, vim.fn.executable("%:t"))
end

function M.setup(opts)
    M.opts = opts
    M.last_command = nil
    M.last_file = nil
end

vim.keymap.set("n", "<space>ht",
               "<cmd>e ~/dotfiles/nvim/lua/uszczi/testing.lua <CR>")
vim.keymap.set("n", "<space>hT",
               "<cmd>e ~/dotfiles/nvim/lua/private/testing.lua <CR>")
return M
