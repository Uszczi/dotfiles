local api = vim.api

local M = {}

local function prune_nil(items)
    return vim.tbl_filter(
        function(x)
            return x
        end,
        items
    )
end

local function get_nodes(query_text, predicate)
    local end_row = api.nvim_win_get_cursor(0)[1]
    local ft = api.nvim_buf_get_option(0, "filetype")
    assert(ft == "python", "test_method of dap-python only works for python files, not " .. ft)
    local query = vim.treesitter.parse_query(ft, query_text)
    assert(query, "Could not parse treesitter query. Cannot find test")
    local parser = vim.treesitter.get_parser(0)
    local root = (parser:parse()[1]):root()
    local nodes = {}
    for _, node in query:iter_captures(root, 0, 0, end_row) do
        if predicate(node) then
            table.insert(nodes, node)
        end
    end
    return nodes
end

local function get_function_nodes()
    local query_text = [[
    (function_definition
      name: (identifier) @name) @definition.function
  ]]
    return get_nodes(
        query_text,
        function(node)
            return node:type() == "identifier"
        end
    )
end

local function get_node_text(node)
    local row1, col1, row2, col2 = node:range()
    if row1 == row2 then
        row2 = row2 + 1
    end
    local lines = api.nvim_buf_get_lines(0, row1, row2, true)
    if #lines == 1 then
        return (lines[1]):sub(col1 + 1, col2)
    end
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
            if node_row1 > result_row1 then
                result = node
            end
        end
    end
    return result
end

function M.test_method()
    local pwd = vim.fn.getcwd()

    local finded = false
    for _, value in pairs(M.opts.registered_directory) do
        if value == pwd then
            finded = true
            break
        end
    end
    if not finded then
        vim.api.nvim_command("TestNearest")
        return
    end

    local function_node = closest_above_cursor(get_function_nodes())
    if not function_node then
        print("No suitable test method found")
        return
    end

    local class = get_parent_classname(function_node)
    local function_name = get_node_text(function_node)
    local path = vim.fn.expand("%:p")

    path = string.gsub(path, pwd .. "/", "")
    local test_path = table.concat(prune_nil({path, class, function_name}), "::")
    vim.api.nvim_command("tabnew")
    vim.api.nvim_command("TabooRename " .. function_name)

    local command
    for _, value in ipairs(M.opts.testing_commands) do
        command = value(test_path)
        if command then
            break
        end
    end

    if command == nil then
        print("Command not found in registered functions")
        return
    end

    command = "call termopen('" .. command .. "')"
    vim.api.nvim_command(command)
    vim.api.nvim_buf_set_keymap(0, "n", "q", ":q<CR>", {})
end

function M.debug_method()
    local pwd = vim.fn.getcwd()

    local finded = false
    for _, value in pairs(M.opts.registered_directory) do
        if value == pwd then
            finded = true
        end
    end
    if not finded then
        -- Fix this, this should be dap python
        vim.api.nvim_command("TestNearest")
        return
    end

    local function_node = closest_above_cursor(get_function_nodes())
    if not function_node then
        print("No suitable test method found")
        return
    end

    local class = get_parent_classname(function_node)
    local function_name = get_node_text(function_node)
    local path = vim.fn.expand("%:p")

    path = string.gsub(path, pwd .. "/", "")
    local test_path = table.concat(prune_nil({path, class, function_name}), "::")
    vim.api.nvim_command("tabnew")
    vim.api.nvim_command("TabooRename " .. function_name)

    local command
    for _, value in ipairs(M.opts.debug_commands) do
        command = value(test_path)
        if command then
            break
        end
    end
    if command == nil then
        print("Command not found in registered functions")
        return
    end

    command = "call termopen('" .. command .. "')"
    vim.api.nvim_command(command)
    vim.api.nvim_buf_set_keymap(0, "n", "q", ":q<CR>", {})
end

function M.setup(opts)
    M.opts = opts
end

-- TODO test and debug last
return M
