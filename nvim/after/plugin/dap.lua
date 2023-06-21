local dap = require("dap")

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

require("dapui").setup(
    {
        layouts = {
            {
                elements = {
                    {
                        id = "scopes",
                        size = 0.25 -- Can be float or integer > 1
                    },
                    {id = "breakpoints", size = 0.25},
                    {id = "stacks", size = 0.25},
                    {id = "watches", size = 0.25}
                },
                size = 40,
                position = "left" -- Can be "left" or "right"
            },
            {
                elements = {
                    "repl",
                    "console"
                },
                size = 10,
                position = "bottom" -- Can be "bottom" or "top"
            },
            {
                elements = {
                    "console"
                },
                size = 20,
                position = "bottom" -- Can be "bottom" or "top"
            }
        }
    }
)

vim.keymap.set({"n", "v"}, "<leader>dw", ":lua require'dapui'.eval()<CR>", {silent = true})
vim.keymap.set(
    "n",
    "<leader>dd",
    function()
        require "dapui".toggle()
    end,
    {silent = true}
)
vim.keymap.set(
    "n",
    "<leader>d,",
    function()
        require "dapui".toggle({layout = 3})
    end,
    {silent = true}
)

vim.keymap.set("v", "<M-k>", ":lua require'dapui'.eval()<CR>", {silent = true})
vim.keymap.set("n", "<leader>de", ":lua require'dap'.toggle_breakpoint()<CR>", {silent = true})
vim.keymap.set("n", "<leader>df", ":lua require'dap'.continue()<CR>", {silent = true})
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.run_to_cursor()<CR>", {silent = true})
vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_over()<CR>", {silent = true})
vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>", {silent = true})
vim.keymap.set(
    "n",
    "<Leader>dl",
    function()
        require("dap").run_last()
    end
)

require("dap-python").setup(nil, {justMyCode = true})
-- require("dap-python").test_runner = "pytest"

-- require("dap").defaults.fallback.exception_breakpoints = {"raised", "uncaught", "userUnhandled"}

require("cmp").setup(
    {
        enabled = function()
            return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
        end
    }
)

require("cmp").setup.filetype(
    {"dap-repl", "dapui_watches", "dapui_hover"},
    {
        sources = {
            {name = "dap"}
        }
    }
)
