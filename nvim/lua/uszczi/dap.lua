local dap = require("dap")
local pythonPath = function()
    -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
    -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
    -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
    local cwd = vim.fn.getcwd()
    if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
        return cwd .. "/venv/bin/python"
    elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
        return cwd .. "/.venv/bin/python"
    else
        return "/usr/bin/python3.9"
    end
end
-- dap.adapters.python = {
--     type = "executable",
--     -- command = "/home/mateusz/roc/roc-factory-app/.venv/bin/python";
--     -- command = "/home/mateusz/roc/roc_order_service/.venv/bin/python";
--     command = pythonPath(),
--     args = {"-m", "debugpy.adapter"}
-- }
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
        pathMappings = {
            {
                localRoot = "/home/mateusz/work/tails/vet",
                remoteRoot = "/app/vet"
            }
        }
    }
}
require("nvim-dap-virtual-text").setup()
require("dapui").setup(
    {
        icons = {expanded = "▾", collapsed = "▸"},
        mappings = {
            -- Use a table to apply multiple mappings
            expand = {"<CR>", "<2-LeftMouse>"},
            open = "o",
            remove = "d",
            edit = "e",
            repl = "r",
            toggle = "t"
        },
        sidebar = {
            -- You can change the order of elements in the sidebar
            elements = {
                -- Provide as ID strings or tables with "id" and "size" keys
                {
                    id = "scopes",
                    size = 0.25 -- Can be float or integer > 1
                },
                {id = "breakpoints", size = 0.25},
                {id = "stacks", size = 0.25},
                {id = "watches", size = 00.25}
            },
            size = 40,
            position = "left" -- Can be "left", "right", "top", "bottom"
        },
        tray = {
            elements = {"repl"},
            size = 10,
            position = "bottom" -- Can be "left", "right", "top", "bottom"
        },
        floating = {
            max_height = nil, -- These can be integers or a float between 0 and 1.
            max_width = nil, -- Floats will be treated as percentage of your screen.
            border = "single", -- Border style. Can be "single", "double" or "rounded"
            mappings = {
                close = {"q", "<Esc>"}
            }
        },
        windows = {indent = 1}
    }
)
