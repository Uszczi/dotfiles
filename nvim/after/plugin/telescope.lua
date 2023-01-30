local set = vim.keymap.set

set(
    "n",
    "<leader><leader>",
    "<cmd>lua require('telescope.builtin').find_files({hidden=true, no_ignore=true})<cr>",
    {silent = false}
)
set("n", "<leader>fg", ":Telescope live_grep<CR>")

-- "nvim-telescope/telescope-symbols.nvim"
set({"n"}, "<C-y>", "<cmd>:lua require'telescope.builtin'.symbols{ sources = {'gitmoji'} }<CR>")

-- VSCode NeoVim extension
if vim.g.vscode then
    set("n", "<leader><leader>", "<cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
end
