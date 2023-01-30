vim.g.neoformat_enabled_lua = {"luafmt"}

local format_group = vim.api.nvim_create_augroup("FormatGroup", {clear = true})
vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        callback = function()
            vim.cmd [[ Neoformat ]]
        end,
        group = format_group,
        pattern = "*"
    }
)
