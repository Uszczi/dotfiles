local run_debuger = function(name)
    local args = {"-m", "debugpy", "--listen", "127.0.0.1:5678", "--wait-for-client", "-m", "scrapy", "crawl", name}
    local j =
        require("plenary.job"):new {
        command = "python",
        args = args
    }
    return j:start()
end

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

local debug = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    local root = get_root(bufnr)

    local name = nil
    for _, node in query:iter_captures(root, bufnr, 0, -1) do
        name = vim.treesitter.get_node_text(node, bufnr)
    end

    name = name:gsub('"', "")
    run_debuger(name)
    print("debuger started")
end

vim.api.nvim_create_user_command(
    "ScrapyDebug",
    function()
        debug()
    end,
    {}
)
