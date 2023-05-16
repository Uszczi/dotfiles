local set = vim.keymap.set

set({"n", "v"}, "<Space>", "<Nop>", {silent = true})

set("n", "k", "v:count == 0 ? 'gk' : 'k'", {expr = true, silent = true})
set("n", "j", "v:count == 0 ? 'gj' : 'j'", {expr = true, silent = true})

set("n", "<leader>hh", ":so %<CR>", {silent = false})

set("n", "[d", vim.diagnostic.goto_prev)
set("n", "]d", vim.diagnostic.goto_next)

set("n", "[q", ":cprevious<CR>")
set("n", "]q", ":cnext<CR>")
set("n", "[Q", ":cfirst<CR>")
set("n", "]Q", ":clast<CR>")

local function get_list_win(list)
    local tabnr = vim.fn.tabpagenr()
    if list == "c" then
        local w =
            vim.tbl_filter(
            function(t)
                return t.tabnr == tabnr and t.quickfix == 1 and t.loclist == 0
            end,
            vim.fn.getwininfo()
        )[1]
        if w then
            return w.winid
        else
            return 0
        end
    else
        return vim.fn.getloclist(0, {winid = 1}).winid or 0
    end
end

local function toggle_list(list)
    if get_list_win(list) ~= 0 then
        vim.cmd("cclose")
    else
        vim.cmd("copen")
        vim.cmd("wincmd p")
    end
end

set("n", "<leader>e", vim.diagnostic.open_float)
set(
    "n",
    "<leader>q",
    function()
        toggle_list("c")
    end
)

set("n", "<C-u>", "<C-u>zz")
set("n", "<C-d>", "<C-d>zz")

-- Terminal
set("t", "jk", "<C-\\><C-N>")

set("n", "<leader>cr", ":w !python %<CR>")
set("n", "<leader>rg", ":e ./plan.ignore.md<CR>")
