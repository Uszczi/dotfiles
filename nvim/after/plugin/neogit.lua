local neogit = require("neogit")

neogit.setup({})

vim.keymap.set("n", "<leader>gg", require "neogit".open)
