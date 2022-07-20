-- https://github.com/onsails/diaglist.nvim

require("diaglist").init(
    {
        debug = false,
        debounce_ms = 150
    }
)

vim.keymap.set(
    "n",
    "<space>xa",
    function()
        require("diaglist").open_all_diagnostics()
    end
)
vim.keymap.set(
    "n",
    "<space>xb",
    function()
        require("diaglist").open_buffer_diagnostics()
    end
)
