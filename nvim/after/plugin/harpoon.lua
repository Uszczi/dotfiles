local harpoon = require("harpoon")
local set = vim.keymap.set

harpoon.setup({
	menu = {
		width = 100,
	},
	global_settings = {
		enter_on_sendcmd = true,
	},
})

set("n", "<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
set("n", "<leader>tt", ":lua require('harpoon.cmd-ui').toggle_quick_menu()<CR>")

set("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>")

set("n", "<leader>rq", ":lua require('harpoon.ui').nav_file(1)<CR>")
set("n", "<leader>rw", ":lua require('harpoon.ui').nav_file(2)<CR>")
set("n", "<leader>re", ":lua require('harpoon.ui').nav_file(3)<CR>")
set("n", "<leader>rr", ":lua require('harpoon.ui').nav_file(4)<CR>")

set("n", "<leader>tu", ":lua require('harpoon.term').gotoTerminal(1)<CR>")
set("n", "<leader>te", ":lua require('harpoon.term').gotoTerminal(2)<CR>")

set("n", "<leader>t1", ":lua require('harpoon.term').sendCommand(1, 1)<CR>")
set("n", "<leader>t2", ":lua require('harpoon.term').sendCommand(1, 2)<CR>")
set("n", "<leader>t3", ":lua require('harpoon.term').sendCommand(1, 3)<CR>")
set("n", "<leader>t4", ":lua require('harpoon.term').sendCommand(1, 4)<CR>")

---
-- local harpoon = require("harpoon")
--
-- harpoon:setup()
--
-- vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
--
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
-- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
-- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
--
-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
