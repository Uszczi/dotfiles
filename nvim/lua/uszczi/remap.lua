local set = vim.keymap.set

set({"n", "v"}, "<Space>", "<Nop>", {silent = true})

set("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
set("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})

set("n", "<leader>hh", ":so %<CR>", {silent = false})

set("n", "[d", vim.diagnostic.goto_prev)
set("n", "]d", vim.diagnostic.goto_next)
set("n", "<leader>e", vim.diagnostic.open_float)
set("n", "<leader>q", vim.diagnostic.setloclist)

-- Terminal
set("t", "jk", "<C-\\><C-N>")

set("n", "<leader>cr", ":w !python %<CR>")
