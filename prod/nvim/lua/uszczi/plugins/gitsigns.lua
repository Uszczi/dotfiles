return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  opts = {},
  keys = {
    {
      "[c",
      "<cmd>Gitsigns prev_hunk<CR>",
      desc = "Jump to previous hunk",
    },
    {
      "]c",
      "<cmd>Gitsigns next_hunk<CR>",
      desc = "Jump to next hunk",
    },
    {
      "<leader>gs",
      "<cmd>Gitsigns stage_hunk<CR>",
      desc = "Stage hunk",
    },
    {
      "<leader>go",
      "<cmd>Gitsigns preview_hunk_inline<CR>",
      desc = "Hunk Diff inline",
    },
    {
      "<leader>gu",
      "<cmd>Gitsigns reset_hunk<CR>",
      desc = "Hunk Undo",
    },
  },
}
