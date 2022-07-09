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
require("uszczi.comment")
require("uszczi.telescope")
require("uszczi.harpoons")
require("uszczi.lsp")
require("uszczi.nvim-cmp")
require("uszczi.nvim-treesiter")
require("uszczi.test")
require("uszczi.nnn")
require("uszczi.nvim-tree")
require("uszczi.dap")
require("uszczi.null-ls")
local p_testing = require("private.testing")
require("uszczi.testing").setup(p_testing.opts)
require("uszczi.refactoring")

-- TODO use lua style
vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}"

require "fidget".setup {}
