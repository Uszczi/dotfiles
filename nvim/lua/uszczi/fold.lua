local api = vim.api

local M = {}

M.fold_all_methods = function()
    local ft = api.nvim_buf_get_option(0, "filetype")
    local query_text = [[
    (function_definition
      name: (identifier) body: (block) @body)
  ]]
    -- local query_text = [[
    --     (function_definition)
    --     ]]
    local query = vim.treesitter.parse_query(ft, query_text)
    local parser = vim.treesitter.get_parser(0)
    local root = (parser:parse()[1]):root()
    -- P(parser)
    local rows = {}
    for _, node in query:iter_captures(root, 0, 0, 100000) do
        local row1, col1, row2, col2 = node:range()
        print(row1, row2)
        table.insert(rows, row1)
    end

    local foldmethod = vim.opt.foldmethod
    vim.opt.foldmethod = "indent"

    for index = #rows, 1, -1 do
        vim.api.nvim_win_set_cursor(0, {rows[index] + 1, 0})
        vim.cmd [[ normal za ]]
    end

    -- vim.opt.foldmethod = foldmethod
end

return M
