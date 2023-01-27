local neogit = require("neogit")

neogit.setup {}

vim.keymap.set("n", "<leader>gg", ":lua require'neogit'.open({})<CR>")
