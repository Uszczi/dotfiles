return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  opts = {},
  keys = {
    {
      "<leader>go",
      "<cmd>Gitsigns preview_hunk_inline<CR>",
      desc = "Hunk Diff inline",
    },
    {
      "<leagO",
      desc = "Hunk Diff",
    },
    {
      "<leader>gu",
      "<cmd>Gitsigns reset_hunk<CR>",
      desc = "Hunk Undo",
    },
  },
}
