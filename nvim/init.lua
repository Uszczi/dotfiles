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
require("uszczi.auto-run-command")
require("uszczi.scrapy-run")
require("uszczi.globals")
require("uszczi.comment")
require("uszczi.harpoons")
require("uszczi.lsp")
require("uszczi.nvim-cmp")
require("uszczi.nvim-treesiter")
require("uszczi.test")
require("uszczi.nnn")
require("uszczi.camelsnek")
require("uszczi.debug_scrapy")
require("uszczi.nvim-tree")
require("uszczi.dap")
require("uszczi.null-ls")
require("uszczi.lukas-diagnostics")
require("uszczi.refactoring")

require("modules")

require("leap").set_default_keymaps()

-- TODO use lua style
vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}"

require "fidget".setup {}

-- vim.cmd("source " .. "~/dotfiles/nvim/" .. "lua/uszczi/colors/gruvbox.vim")
require("uszczi.colors.tokyonight")
