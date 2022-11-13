-- "/home/mateusz/.pyenv/bin:

vim.api.nvim_create_autocmd(
    "TermOpen",
    {
        group = vim.api.nvim_create_augroup("teej-automagic", {clear = true}),
        pattern = "*",
        callback = function()
            print("termopen")
        end
    }
)
