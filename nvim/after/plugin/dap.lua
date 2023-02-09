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

dap.configurations.python = {
    {
        type = "generic_remote",
        name = "Generic remote",
        request = "attach",
        redirectOutput = true,
        justMyCode = false
    },
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = pythonPath(),
        justMyCode = false
    }
}

require("dapui").setup({})

dap.adapters.delve = {
    type = "server",
    port = "${port}",
    executable = {command = "dlv", args = {"dap", "-l", "127.0.0.1:${port}"}}
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
    {type = "delve", name = "Debug", request = "launch", program = "${file}"},
    {
        type = "delve",
        name = "Debug test",
        request = "launch",
        mode = "test",
        program = "${file}"
    },
    {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}"
    }
}

vim.keymap.set({"n", "v"}, "<leader>dw", ":lua require'dapui'.eval()<CR>", {silent = true})
vim.keymap.set("n", "<leader>dd", ":lua require'dapui'.open()<CR>", {silent = true})
vim.keymap.set("v", "<M-k>", ":lua require'dapui'.eval()<CR>", {silent = true})

vim.keymap.set("n", "<leader>de", ":lua require'dap'.toggle_breakpoint()<CR>", {silent = true})
vim.keymap.set("n", "<leader>df", ":lua require'dap'.continue()<CR>", {silent = true})
vim.keymap.set("n", "<leader>dc", ":lua require'dap'.run_to_cursor()<CR>", {silent = true})
