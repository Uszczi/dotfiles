require("uszczi.plugins")
require("uszczi.globals")

-- Theme
require("uszczi.theme.onedark")

require("uszczi.scrapy-run")
require("uszczi.scrapy-debug")

vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}"

vim.keymap.set("n", " pv", vim.cmd.Ex)
