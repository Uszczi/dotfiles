require "uszczi"

-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup(
    {
        sort_by = "case_sensitive",
        view = {
            width = 30,
            mappings = {
                list = {
                    {key = "u", action = "dir_up"}
                }
            }
        },
        renderer = {
            group_empty = true
        },
        filters = {
            dotfiles = true
        }
    }
)

vim.keymap.set("n", "<leader>op", ":NvimTreeFindFileToggle<CR>", {silent = false})

vim.keymap.set("n", "<leader>dy", ":lua R('nvim-scrapy-debug').debug()<CR>", {silent = false})

vim.keymap.set("n", "css", ":Snek<cr>")
vim.keymap.set("v", "css", ":Snek<cr>")

vim.keymap.set("n", "csc", ":CamelB<cr>")
vim.keymap.set("v", "csc", ":CamelB<cr>")

vim.keymap.set("n", "csx", ":Kebab<cr>")
vim.keymap.set("v", "csx", ":Kebab<cr>")

vim.keymap.set("n", "cse", ":CamelB<cr>bgUle")
vim.keymap.set("v", "cse", ":CamelB<cr>bgUle")
