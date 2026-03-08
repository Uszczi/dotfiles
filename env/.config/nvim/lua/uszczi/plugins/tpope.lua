return {
  "tpope/vim-fugitive",
  dependencies = {
    "tommcdo/vim-fubitive",
    "tpope/vim-repeat",
    "tpope/vim-rhubarb",
    "tpope/vim-sleuth",
  },

  config = function() vim.keymap.set("n", "<Space>gg", ":Git<CR>") end,
}
