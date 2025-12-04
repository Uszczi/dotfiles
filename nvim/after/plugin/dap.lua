local dap = require("dap")
local dapui = require("dapui")

local set = vim.keymap.set

require("nvim-dap-virtual-text").setup({})

local pythonPath = function()
    return ".venv/bin/python"
end

dap.adapters.python = {
    type = "executable",
    command = pythonPath(),
    args = {"-m", "debugpy.adapter"}
}

dap.adapters.generic_remote = function(callback, config)
    callback({type = "server", host = "127.0.0.1", port = 5678})
end

require("neodev").setup({library = {plugins = {"nvim-dap-ui"}, types = true}})
dapui.setup(
    {
        layouts = {
            {
                elements = {
                    {id = "scopes", size = 0.25},
                    {id = "breakpoints", size = 0.25},
                    {id = "stacks", size = 0.25},
                    {id = "watches", size = 0.25}
                },
                position = "left",
                size = 40
            },
            {elements = {{id = "repl", size = 1}}, position = "bottom", size = 10}
        }
    }
)

set({"n", "v"}, "<leader>dw", ":lua require'dapui'.eval()<CR>")
set(
    "n",
    "<leader>dd",
    function()
        dapui.toggle()
    end
)
set(
    "n",
    "<leader>da",
    function()
        dapui.toggle({layout = 2})
    end
)

set("v", "<M-k>", ":lua require'dapui'.eval()<CR>")
set("n", "<leader>de", ":lua require'dap'.toggle_breakpoint()<CR>")
set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
set("n", "<leader>df", ":lua require'dap'.continue()<CR>")
set("n", "<leader>dc", ":lua require'dap'.run_to_cursor()<CR>")
set("n", "<leader>do", ":lua require'dap'.step_over()<CR>")
set("n", "<leader>di", ":lua require'dap'.step_into()<CR>")
set(
    "n",
    "<Leader>dl",
    function()
        require("dap").run_last()
    end
)

-- require("dap-python").setup({ rocks = {hererocks = false, enabled = false} }, {justMyCode = false, rocks = {hererocks = false, enabled = false})
-- require("dap-python").test_runner = "pytest"

-- require("dap").defaults.fallback.exception_breakpoints = {"raised", "uncaught", "userUnhandled"}

require("cmp").setup(
    {
        enabled = function()
            return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
        end
    }
)

require("cmp").setup.filetype({"dap-repl", "dapui_watches", "dapui_hover"}, {sources = {{name = "dap"}}})

-- table.insert(
--     require("dap").configurations.python,
--     {
--         type = "generic_remote",
--         name = "Attach to docker",
--         request = "attach",
--         redirectOutput = true,
--         justMyCode = false,
--         pathMappings = {{localRoot = vim.fn.getcwd(), remoteRoot = "/code"}}
--     }
-- )
