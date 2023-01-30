local set = vim.keymap.set
local telescope = require("telescope")

telescope.setup {}

if vim.fn.has("unix") == 1 then
    require("telescope").load_extension("fzf")
end

set(
    "n",
    "<leader><leader>",
    function()
        require("telescope.builtin").find_files({hidden = true, no_ignore = true})
    end,
    {silent = false}
)
set("n", "<leader>fg", require("telescope.builtin").live_grep)
set("n", "<leader>?", require("telescope.builtin").oldfiles)

-- "nvim-telescope/telescope-symbols.nvim"
set(
    "n",
    "<C-y>",
    function()
        require("telescope.builtin").symbols {sources = {"gitmoji"}}
    end
)

-- VSCode NeoVim extension
if vim.g.vscode then
    set("n", "<leader><leader>", "<cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
end
