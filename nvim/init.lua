require("uszczi")

require("nvim-tree").setup({
	reload_on_bufenter = true,
	update_focused_file = {
		enable = true,
	},
})

vim.keymap.set("n", "<leader>op", ":NvimTreeFindFileToggle<CR>", { silent = false })

vim.keymap.set("n", "css", ":Snek<cr>")
vim.keymap.set("v", "css", ":Snek<cr>")

vim.keymap.set("n", "csc", ":CamelB<cr>")
vim.keymap.set("v", "csc", ":CamelB<cr>")

vim.keymap.set("n", "csx", ":Kebab<cr>")
vim.keymap.set("v", "csx", ":Kebab<cr>")

vim.keymap.set("n", "cse", ":CamelB<cr>bgUle")
vim.keymap.set("v", "cse", ":CamelB<cr>bgUle")

vim.lsp.enable("ty")
