return {
  "mhinz/vim-signify",
  keys = {
    {
      "<leader>go",
      "<cmd>SignifyHunkDiff<CR>",
      desc = "Signify Hunk Diff",
      silent = true,
    },
    {
      "<leader>gu",
      "<cmd>SignifyHunkUndo<CR>",
      desc = "Signify Hunk Undo",
      silent = true,
    },
  },
}
