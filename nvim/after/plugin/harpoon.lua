local harpoon = require("harpoon")
local set = vim.keymap.set

harpoon.setup {
    menu = {
        width = 100
    },
    global_settings = {
        enter_on_sendcmd = true
    }
}

set("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {silent = true})
set("n", "<leader>tt", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>", {silent = true})

set("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", {silent = true})

set("n", "<leader>rq", ":lua require('harpoon.ui').nav_file(1)<CR>", {silent = true})
set("n", "<leader>rw", ":lua require('harpoon.ui').nav_file(2)<CR>", {silent = true})
set("n", "<leader>re", ":lua require('harpoon.ui').nav_file(3)<CR>", {silent = true})
set("n", "<leader>rr", ":lua require('harpoon.ui').nav_file(4)<CR>", {silent = true})

set("n", "<leader>tu", ":lua require('harpoon.term').gotoTerminal(1)<CR>", {silent = true})
set("n", "<leader>te", ":lua require('harpoon.term').gotoTerminal(2)<CR>", {silent = true})

set("n", "<leader>t1", ":lua require('harpoon.term').sendCommand(1, 1)<CR>")
set("n", "<leader>t2", ":lua require('harpoon.term').sendCommand(1, 2)<CR>")
set("n", "<leader>t3", ":lua require('harpoon.term').sendCommand(1, 3)<CR>")
