local set = vim.keymap.set

set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


set('n', '<leader>hn', ":Ex $HOME/dotfiles/nvim-new<CR>", { silent = true })
set('n', '<leader>hh', ":so %<CR>", { silent = false })

-- Telescope
set('n', '<leader><leader>', "<cmd>lua require('telescope.builtin').find_files({hidden=true, no_ignore=true})<cr>", { silent = false })


if vim.g.vscode then
	set('n', '<leader><leader>', "<cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
end




set('t', 'jk', '<C-\\><C-N>')
