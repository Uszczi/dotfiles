-- New init
require("uszczi.plugins")

require("uszczi.nvim-autopairs")
require("uszczi.surround")

-- Theme
require("uszczi.theme.tokyonight")

-- OLD
require("uszczi.auto-run-command")
require("uszczi.scrapy-run")
require("uszczi.globals")
require("uszczi.comment")
require("uszczi.harpoons")
require("uszczi.lsp")
require("uszczi.nvim-cmp")
require("uszczi.nvim-treesiter")
require("uszczi.test")
require("uszczi.camelsnek")
require("uszczi.debug_scrapy")
require("uszczi.nvim-tree")
require("uszczi.dap")
require("uszczi.null-ls")
require("uszczi.lukas-diagnostics")
require("uszczi.refactoring")
require("uszczi.telescope")

require("leap").set_default_keymaps()

-- TODO use lua style
vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}"

require "fidget".setup {}
