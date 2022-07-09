require("refactoring").setup({})

vim.api.nvim_set_keymap(
    "v",
    "<space>rf",
    ":lua require('refactoring').select_refactor()<CR>",
    {noremap = true, silent = true, expr = false}
)
vim.api.nvim_set_keymap(
    "n",
    "<space>rv",
    ":lua require('refactoring').debug.print_var({ normal = true })<CR>",
    {noremap = true}
)
vim.api.nvim_set_keymap("v", "<space>rv", ":lua require('refactoring').debug.print_var({})<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<space>rc", ":lua require('refactoring').debug.cleanup({})<CR>", {noremap = true})
