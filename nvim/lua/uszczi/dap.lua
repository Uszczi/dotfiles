local dap = require("dap")

require("nvim-dap-virtual-text").setup()

local pythonPath = function()
    local cwd = vim.fn.getcwd()
    if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
        return cwd .. "/venv/bin/python"
    elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
        return cwd .. "/.venv/bin/python"
    else
        return "/usr/bin/python3.10"
    end
end

dap.adapters.python = {
    type = "executable",
    command = pythonPath(),
    args = {"-m", "debugpy.adapter"}
}

dap.adapters.generic_remote = function(callback, config)
    callback(
        {
            type = "server",
            host = "127.0.0.1",
            port = 5678
        }
    )
end

dap.configurations.python = {
    {
        type = "generic_remote",
        name = "Generic remote",
        request = "attach",
        redirectOutput = true,
        justMyCode = false
        -- pathMappings = {
        --     {
        --         localRoot = "/home/mateusz/work/tails",
        --         remoteRoot = "/app"
        --     }
        -- }
    },
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = pythonPath()
    }
}

require("dapui").setup(
    {
        layouts = {
            {
                elements = {
                    "scopes",
                    "breakpoints",
                    "stacks",
                    "watches"
                },
                size = 40,
                position = "left"
            },
            {
                elements = {
                    "repl"
                    -- "console"
                },
                size = 10,
                position = "bottom"
            }
        }
    }
)
