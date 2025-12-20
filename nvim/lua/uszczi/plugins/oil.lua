return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    opts = {
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<C-v>"] = {
          "actions.select",
          opts = { vertical = true },
          desc = "Open the entry in a vertical split",
        },
        ["<C-x>"] = {
          "actions.select",
          opts = { horizontal = true },
          desc = "Open the entry in a horizontal split",
        },
      },
    },

    keys = {
      { "<leader>fv", "<CMD>Oil<CR>", desc = "Open Oil" },
      { "-", "<CMD>Oil<CR>", desc = "Open Oil" },
      {
        "<leader>-",
        function() require("oil").toggle_float() end,
      },
      {
        "<leader>i",
        function() require("oil").toggle_float() end,
      },
    },
  },
}
