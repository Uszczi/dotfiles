local query =
    vim.treesitter.parse_query(
    "python",
    [[
        (expression_statement
            (assignment
                left: (identifier) @field_name (#eq? @field_name "name")
                right: (string) @name
            )
        )
    ]]
)

local get_root = function(bufnr)
    local parser = vim.treesitter.get_parser(bufnr, "python", {})
    local tree = parser:parse()[1]
    return tree:root()
end

local run = function(output_bufnr)
    local bufnr = vim.api.nvim_get_current_buf()
    local root = get_root(bufnr)

    local name = nil
    for _, node in query:iter_captures(root, bufnr, 0, -1) do
        name = vim.treesitter.get_node_text(node, bufnr)
    end

    name = name:gsub('"', "")
    local command = {"scrapy", "crawl", name, "-O", "output.json"}

    local append_data = function(_, data)
        if data then
            vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
        end
    end

    vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, {""})
    vim.fn.jobstart(
        command,
        {
            stdout_buffered = true,
            on_stdout = append_data,
            on_stderr = append_data
        }
    )
end

local output_bufnr = nil

vim.api.nvim_create_user_command(
    "ScrapyRun",
    function()
        if output_bufnr == nil then
            output_bufnr = vim.fn.input("Buffnr: ")
            output_bufnr = tonumber(output_bufnr)
        end

        run(output_bufnr)
    end,
    {}
)
