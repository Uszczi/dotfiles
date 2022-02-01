vim.g.mapleader = " "

local fn = vim.fn
local execute = vim.api.nvim_command

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd "autocmd BufWritePost plugins.lua PackerCompile"

require("plugins")

require("nvim-mapper").setup({})
require("telescope").load_extension("project")
require("telescope").load_extension("harpoon")
require("telescope").load_extension("fzf")
require("rust-tools").setup({})
require("nvim_comment").setup()
-- # TODO move that
require("dap.ext.vscode").load_launchjs()


-- My lua


local neogit = require("neogit")

neogit.setup {
    integrations = {
        diffview = true
    }
}

require("plugins.lsp")
require("plugins.completion")
require("plugins.dap-ui")
require("plugins.dap")
require("plugins.format")
require("plugins.harpoon")
require("plugins.nvim-tree")
require("go_to_file")

vim.cmd("source " .. "~/.config/nvim/plugins/keymaps.vim")
vim.cmd("source " .. "~/.config/nvim/autoload/tj.vim")
vim.cmd("source " .. "~/.config/nvim/plugins/set.vim")
vim.cmd("source " .. "~/.config/nvim/plugins/airline.vim")
vim.cmd("source " .. "~/.config/nvim/plugins/colorscheme-gruvbox.vim")
vim.cmd("source " .. "~/.config/nvim/plugins/floaterm.vim")
-- vim.cmd("source " .. "~/.config/nvim/plugins/go_to_file.vim")

-- TODO Create autogroup
vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}"

require "nvim-treesitter.configs".setup {
    highlight = {
        enable = true
    }
}


-- require('dap-python').setup('~/roc/cat-app/.venv/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'





