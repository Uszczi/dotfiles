require("uszczi.plugins")

require("uszczi.lsp.mason")

require("uszczi.nvim-autopairs")
require("uszczi.lualine")

require("uszczi.neovim")
require("uszczi.lazy-git")
require("uszczi.octo")

-- Theme
require("uszczi.theme.tokyonight")

require("uszczi.scrapy-run")
require("uszczi.scrapy-debug")

require("uszczi.globals")
require("uszczi.comment")
require("uszczi.harpoons")
require("uszczi.lsp")
require("uszczi.nvim-cmp")
require("uszczi.nvim-treesiter")
require("uszczi.nvim-tree")
require("uszczi.dap")
require("uszczi.null-ls")
require("uszczi.lukas-diagnostics")
require("uszczi.refactoring")

require("leap").set_default_keymaps()

vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}"

require "fidget".setup {}

-- if pcall(require, "noice") then
--   return
-- end
