vim.g.neoformat_enabled_lua = {"luafmt"}
vim.g.neoformat_enabled_python = {"black"}
vim.g.neoformat_enabled_javascript = {"prettierd"}

vim.keymap.set("n", "<leader>cc", ":Neoformat<CR>")

vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        pattern = "*js,*lua,*py",
        callback = function()
            vim.cmd [[ Neoformat ]]
        end
    }
)
