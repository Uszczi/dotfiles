require "uszczi"

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup(
    {
        reload_on_bufenter = true,
        update_focused_file = {
            enable = true
        }
    }
)

vim.keymap.set("n", "<leader>op", ":NvimTreeFindFileToggle<CR>", {silent = false})

vim.keymap.set("n", "<leader>dy", ":lua R('nvim-scrapy-debug').debug()<CR>", {silent = false})

vim.keymap.set("n", "css", ":Snek<cr>")
vim.keymap.set("v", "css", ":Snek<cr>")

vim.keymap.set("n", "csc", ":CamelB<cr>")
vim.keymap.set("v", "csc", ":CamelB<cr>")

vim.keymap.set("n", "csx", ":Kebab<cr>")
vim.keymap.set("v", "csx", ":Kebab<cr>")

vim.keymap.set("n", "cse", ":CamelB<cr>bgUle")
vim.keymap.set("v", "cse", ":CamelB<cr>bgUle")

local run_debuger = function(name)
    local args = {
        "-m",
        "debugpy",
        "--listen",
        "127.0.0.1:5678",
        "--wait-for-client",
        "-m",
        "scrapy",
        "crawl",
        name
    }
    local j =
        require("plenary.job"):new {
        command = "python",
        args = args,
        on_exit = function(e)
            print("on_exit")
            print(e)
        end,
        on_stdout = function(j, return_val)
            print(return_val)
            print(j:result())
        end,
        on_stderr = function(e)
            print("on_stderr")
            print(e)
        end,
        start = function()
            print("start")
        end,
        on_error = function()
            print("on_error")
        end
    }
    return j:start()
end

local get_query = function()
    return vim.treesitter.parse_query(
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
end

local get_root = function(bufnr)
    local parser = vim.treesitter.get_parser(bufnr, "python", {})
    local tree = parser:parse()[1]
    return tree:root()
end

local debug = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    local root = get_root(bufnr)

    local name = nil
    for _, node in get_query():iter_captures(root, bufnr, 0, -1) do
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
