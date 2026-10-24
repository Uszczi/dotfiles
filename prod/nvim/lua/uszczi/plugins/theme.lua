return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    priority = 1000,
    init = function() vim.cmd([[colorscheme catppuccin]]) end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
  },
}
