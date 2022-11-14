vim.api.nvim_create_autocmd(
    "TermClose",
    {
        group = vim.api.nvim_create_augroup("lazy-git-close", {clear = true}),
        pattern = "*lazygit*",
        callback = function()
            vim.opt.timeoutlen = 1000
        end
    }
)

vim.api.nvim_create_autocmd(
    "TermOpen",
    {
        group = vim.api.nvim_create_augroup("lazy-git-open", {clear = true}),
        pattern = "*lazygit*",
        callback = function()
            vim.opt.timeoutlen = 10
        end
    }
)
