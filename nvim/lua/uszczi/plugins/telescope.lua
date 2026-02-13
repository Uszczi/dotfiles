local builtin = require("telescope.builtin")

return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "folke/trouble.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-dap.nvim",
    },
    keys = {
      { "<leader><leader>", function() require("telescope.builtin").find_files() end, desc = "Find Files" },
      {
        "<leader>ff",
        function() require("telescope.builtin").find_files({ hidden = true, no_ignore = true }) end,
        desc = "Find All Files",
      },
      {
        "<leader>hn",
        function() require("telescope.builtin").find_files({ hidden = true, no_ignore = true, cwd = "~/dotfiles/" }) end,
        desc = "Find Dotfiles",
      },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
      { "<leader>l", function() require("telescope.builtin").live_grep() end, desc = "Live Grep" },
      {
        "<leader>gf",
        function() require("telescope.builtin").live_grep({ additional_args = { "--no-ignore", "--hidden" } }) end,
        desc = "Grep All",
      },
      {
        "<leader>m",
        function() require("telescope.builtin").grep_string() end,
        mode = { "n", "v" },
        desc = "Grep String",
      },
      {
        "<leader>fG",
        function() require("telescope.builtin").grep_string() end,
        mode = { "n", "v" },
        desc = "Grep String",
      },
      {
        "<leader>fc",
        function() require("telescope.builtin").live_grep({ default_text = "class " }) end,
        mode = { "n", "v" },
        desc = "Find Class",
      },
      {
        "<leader>ft",
        function() require("telescope.builtin").live_grep({ additional_args = { "--fixed-strings" } }) end,
        desc = "Fixed String Grep",
      },
      { "<leader>?", function() require("telescope.builtin").oldfiles() end, desc = "Old Files" },
      { "<leader>fr", function() require("telescope.builtin").resume() end, desc = "Resume" },
      { "<leader>fe", function() require("telescope.builtin").lsp_references() end, desc = "LSP References" },
      { "<leader>fd", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
      { "<leader>v", function() require("telescope.builtin").git_files() end, desc = "Git Files" },
      {
        "<C-y>",
        function() require("telescope.builtin").symbols({ sources = { "gitmoji" } }) end,
        mode = { "n", "i" },
        desc = "Gitmoji",
      },
      {
        "<leader>fp",
        function() require("telescope").extensions.project.project({ display_type = "full" }) end,
        desc = "Projects",
      },
      {
        "<leader>fw",
        function() require("telescope").extensions.file_browser.file_browser({ cwd = "~/work/notes/reg" }) end,
        desc = "Work Notes",
      },
      { "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", desc = "File Browser" },
      { "<space>tb", ":Telescope buffers<CR>", desc = "Buffers" },
    },
    config = function()
      local telescope = require("telescope")
      local trouble = require("trouble.sources.telescope")

      telescope.setup({
        extensions = {
          project = {},
        },
        defaults = {
          mappings = {
            i = { ["<c-t>"] = trouble.open },
            n = { ["<c-t>"] = trouble.open },
          },
          layout_strategy = "vertical",
        },
      })

      if vim.fn.has("unix") == 1 then telescope.load_extension("fzf") end

      telescope.load_extension("ui-select")
      telescope.load_extension("project")
      telescope.load_extension("file_browser")
      telescope.load_extension("dap")
      pcall(telescope.load_extension, "ocd")
    end,
  },

  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("git-worktree").setup({
        change_directory_command = "cd",
        update_on_change = true,
        update_on_change_command = "e .",
        clearjumps_on_change = true,
        autopush = false,
      })
    end,
  },
}
