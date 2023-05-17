local dap = require("dap")

require("nvim-dap-virtual-text").setup({})

local pythonPath = function()
    return "python"
end

dap.adapters.python = {
    type = "executable",
    command = pythonPath(),
    args = {"-m", "debugpy.adapter"}
}

dap.adapters.generic_remote = function(callback, config)
    callback({type = "server", host = "127.0.0.1", port = 5678})
end

require("dapui").setup({})

vim.keymap.set({"n", "v"}, "<leader>dw", ":lua require'dapui'.eval()<CR>", {silent = true})
vim.keymap.set(
    "n",
    "<leader>dd",
    function()
        require "dapui".toggle()
    end,
    {silent = true}
)

vim.keymap.set("v", "<M-k>", ":lua require'dapui'.eval()<CR>", {silent = true})

vim.keymap.set("n", "<leader>de", ":lua require'dap'.toggle_breakpoint()<CR>", {silent = true})
vim.keymap.set("n", "<leader>df", ":lua require'dap'.continue()<CR>", {silent = true})
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.run_to_cursor()<CR>", {silent = true})
vim.keymap.set("n", "<leader>do", ":lua require'dap'.step_over()<CR>", {silent = true})
vim.keymap.set("n", "<leader>di", ":lua require'dap'.step_into()<CR>", {silent = true})

require("dap-python").setup(nil, {justMyCode = true})
require("dap-python").test_runner = "pytest"

-- require("dap").defaults.fallback.exception_breakpoints = {"raised", "uncaught", "userUnhandled"}

table.insert(
    require("dap").configurations.python,
    {
        type = "python",
        request = "launch",
        name = "Run generator",
        program = "/home/mat/work/datalake-ioc/dataflow/tools/bin/lakeadm.py",
        cwd = "/home/mat/work/datalake-ioc/",
        args = function()
            local args_string = vim.fn.input("Arguments: ")
            return vim.split(args_string, " +")
        end
        -- ... more options, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings
    }
)

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
