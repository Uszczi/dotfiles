local telescope = require("telescope")

local trouble = require("trouble.sources.telescope")

local set = vim.keymap.set

telescope.setup {
    extensions = {
        project = {}
    },
    defaults = {
        mappings = {
            i = {["<c-t>"] = trouble.open},
            n = {["<c-t>"] = trouble.open}
        },
        layout_strategy = "vertical"
    }
}

if vim.fn.has("unix") == 1 then
    telescope.load_extension("fzf")
end

telescope.load_extension("dap")
telescope.load_extension("ui-select")

require("git-worktree").setup(
    {
        change_directory_command = "cd",
        update_on_change = true,
        update_on_change_command = "e .",
        clearjumps_on_change = true,
        autopush = false
    }
)

pcall(telescope.load_extension, "ocd")
-- print(vim.inspect(telescope.extensions.ocd.source()))

set("n", "<leader><leader>", require("telescope.builtin").find_files)
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
        require("telescope.builtin").find_files({hidden = true, no_ignore = true, cwd = "~/dotfiles/"})
    end,
    {silent = false}
)

set("n", "<leader>fg", require("telescope.builtin").live_grep)
set("n", "<leader>l", require("telescope.builtin").live_grep)
set(
    "n",
    "<leader>gf",
    function()
        require("telescope.builtin").live_grep({additional_args = {"--no-ignore", "--hidden"}})
    end
)
set({"n", "v"}, "<leader>m", require("telescope.builtin").grep_string)
set({"n", "v"}, "<leader>fG", require("telescope.builtin").grep_string)
set(
    {"n", "v"},
    "<leader>fc",
    function()
        require("telescope.builtin").live_grep {default_text = "class "}
    end
)

set(
    "n",
    "<leader>ft",
    function()
        require "telescope.builtin".live_grep({additional_args = {"--fixed-strings"}})
    end
)
set("n", "<leader>?", require("telescope.builtin").oldfiles)
set("n", "<leader>fr", require("telescope.builtin").resume)
set("n", "<leader>fe", require("telescope.builtin").lsp_references)
set("n", "<leader>fd", require("telescope.builtin").diagnostics)
set("n", "<leader>v", require("telescope.builtin").git_files)

-- nvim-telescope/telescope-symbols.nvim
set(
    {"n", "i"},
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

set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {noremap = true})
set("n", "<space>tb", ":Telescope buffers<CR>", {noremap = true})
