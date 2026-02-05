return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
  },
  keys = {
    {

      "<leader>go",
      "<cmd>Gitsigns preview_hunk_inline<CR>",
      desc = "Hunk Diff inline",
    },
    {

      "<leader>gO",
      "<cmd>Gitsigns preview_hunk<CR>",
      desc = "Hunk Diff",
    },
    {
      "<leader>gu",
      "<cmd>Gitsigns reset_hunk<CR>",
      desc = "Hunk Undo",
    },
  },
}
