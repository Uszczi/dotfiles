local oil = require("oil")

oil.setup(
    {
        view_options = {show_hidden = true},
        keymaps = {
            ["<C-v>"] = {"actions.select", opts = {vertical = true}, desc = "Open the entry in a vertical split"},
            ["<C-x>"] = {"actions.select", opts = {horizontal = true}, desc = "Open the entry in a horizontal split"}
        }
    }
)

vim.keymap.set("n", "<leader>fv", "<CMD>Oil<CR>", {})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", {})
vim.keymap.set("n", "<leader>-", oil.toggle_float, {})
vim.keymap.set("n", "<leader>i", oil.toggle_float, {})
