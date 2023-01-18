require("uszczi.plugins")
require("uszczi.globals")

-- Theme
require("uszczi.theme.onedark")

require("uszczi.scrapy-run")
require("uszczi.scrapy-debug")

vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", {}),
    pattern = "*",
    callback = function() vim.highlight.on_yank({higroup = "IncSearch"}) end
})

vim.keymap.set("n", " pv", vim.cmd.Ex)
