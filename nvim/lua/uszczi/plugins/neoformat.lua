vim.g.neoformat_enabled_lua = {"luafmt"}
vim.g.neoformat_enabled_python = {"black"}

vim.keymap.set("n", "<leader>cc", ":Neoformat<CR>")
