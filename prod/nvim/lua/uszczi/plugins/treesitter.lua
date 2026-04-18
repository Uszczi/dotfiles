return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
          },
        },
      })
    end,
    init = function()
      vim.keymap.set(
        { "x", "o" },
        "am",
        function() require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects") end
      )
      vim.keymap.set(
        { "x", "o" },
        "im",
        function() require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects") end
      )
      vim.keymap.set(
        { "x", "o" },
        "ac",
        function() require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects") end
      )
      vim.keymap.set(
        { "x", "o" },
        "ic",
        function() require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects") end
      )
    end,
  },
}
