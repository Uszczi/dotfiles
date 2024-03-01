local set = vim.keymap.set

set("n", "<leader>hh", ":so %<CR>")

set("n", "[d", vim.diagnostic.goto_prev)
set("n", "]d", vim.diagnostic.goto_next)
set("n", "[q", ":cprevious<CR>")
set("n", "]q", ":cnext<CR>")
set("n", "[Q", ":cfirst<CR>")
set("n", "]Q", ":clast<CR>")
set("n", "[w", ":cprevious<CR>")
set("n", "]e", ":cnext<CR>")

set(
    "n",
    "]q",
    function()
        require("trouble").next({skip_groups = true, jump = true})
    end
)
set(
    "n",
    "[q",
    function()
        require("trouble").previous({skip_groups = true, jump = true})
    end
)

set(
    "n",
    "[Q",
    function()
        require("trouble").first({skip_groups = true, jump = true})
    end
)
set(
    "n",
    "]Q",
    function()
        require("trouble").last({skip_groups = true, jump = true})
    end
)

set("n", "<leader>e", vim.diagnostic.open_float)

set("n", "<C-u>", "<C-u>zz")
set("n", "<C-d>", "<C-d>zz")
set("n", "n", "nzz", {remap = true})
set("n", "N", "Nzz", {remap = true})

set("n", "<leader>cr", ":w !python %<CR>")
set("n", "<leader>rg", ":e ./plan.ignore.md<CR>")

set("t", "jk", "<C-\\><C-N>")

set("n", "<leader>gd", ":DiffviewOpen<CR>")
