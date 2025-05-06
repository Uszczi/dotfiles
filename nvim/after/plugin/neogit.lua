local neogit = require("neogit")

neogit.setup(
    {
        status = {
            recent_commit_count = 30
        },
        integrations = {
            telescope = true,
            diffview = true,
            fzf_lua = true,
        }
    }
)

vim.keymap.set("n", "<leader>gg", neogit.open)
vim.keymap.set(
    "n",
    "<C-i>",
    function()
        require "neogit".open {kind = "replace"}
    end
)


