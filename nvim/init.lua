vim.g.leader = " "

local fn = vim.fn
local execute = vim.api.nvim_command

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd [[packadd packer.nvim]]
vim.cmd "autocmd BufWritePost uszczi/packer.lua PackerCompile"

require("uszczi.plugins_list")
require("uszczi.globals")
require("plugins.comment")
require("plugins.telescope")
require("plugins.harpoon")
require("plugins.lsp")
require("plugins.nvim-cmp")
require("plugins.nvim-treesiter")
require("plugins.test")
require("plugins.nvim-tree")

local plugins = {
    "set", -- that those probably to plugin
    "keymaps",
    -- that those probably to plugin
    "colorschema/gruvbox"
}
for _, plugin in pairs(plugins) do
    vim.cmd("source ~/.config/nvim/plugins/" .. plugin .. ".vim")
end

-- TODO
-- [ x ] add cmp
-- [] Move set and keymaps to the plugin
-- [] Auto format lua file on save
-- [] Remove keymaps to the lsp mode

vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}"

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
        return "/usr/bin/python"
    end
end
dap.adapters.python = {
    type = "executable",
    -- command = "/home/mateusz/roc/roc-factory-app/.venv/bin/python";
    -- command = "/home/mateusz/roc/roc_order_service/.venv/bin/python";
    command = pythonPath(),
    args = {"-m", "debugpy.adapter"}
}

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
require("nnn").setup()
