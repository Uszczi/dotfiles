vim.g.neoformat_enabled_lua = {"luafmt"}
vim.g.neoformat_run_all_formatters = 1
vim.g.neoformat_verbose = 0

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