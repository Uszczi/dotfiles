local set = vim.keymap.set
local telescope = require("telescope")

telescope.setup {
    extensions = {
        project = {}
    }
}

if vim.fn.has("unix") == 1 then
    telescope.load_extension("fzf")
end

telescope.load_extension("dap")
telescope.load_extension("file_browser")

set("n", "<leader><leader>", require("telescope.builtin").find_files, {silent = false})
set(
    "n",
    "<leader>ff",
    function()
        require("telescope.builtin").find_files({hidden = true, no_ignore = true})
    end,
    {silent = false}
)
set(
    "n",
    "<leader>hn",
    function()
        require("telescope.builtin").find_files({hidden = true, no_ignore = true, cwd = "~/dotfiles/nvim/"})
    end,
    {silent = false}
)

set("n", "<leader>fg", require("telescope.builtin").live_grep)
set({"n", "v"}, "<leader>fG", require("telescope.builtin").grep_string)
set("n", "<leader>?", require("telescope.builtin").oldfiles)
set("n", "<leader>fr", require("telescope.builtin").resume)
set("n", "<leader>fd", require("telescope.builtin").diagnostics)

-- nvim-telescope/telescope-symbols.nvim
set(
    "n",
    "<C-y>",
    function()
        require("telescope.builtin").symbols {sources = {"gitmoji"}}
    end
)

-- nvim-telescope/telescope-project.nvim
telescope.load_extension("project")
set(
    "n",
    "<leader>fp",
    ":lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>",
    {silent = true}
)

-- VSCode NeoVim extension
if vim.g.vscode then
    set("n", "<leader><leader>", "<cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
end

set("n", "<leader>fw", ":lua require'telescope'.extensions.file_browser.file_browser({cwd = '~/work/notes/reg'})<CR>")
