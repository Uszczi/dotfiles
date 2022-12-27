local telescope = require("telescope")

pcall(telescope.load_extension, "project")
pcall(telescope.load_extension, "lazygit")
pcall(telescope.load_extension, "dap")
pcall(telescope.load_extension, "refactoring")
pcall(telescope.load_extension, "gh")
pcall(telescope.load_extension, "fzf")

local success, git_worktree = pcall(require, "git-worktree")
if success then
    git_worktree.setup({})
    telescope.load_extension("git_worktree")
end
