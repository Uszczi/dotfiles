return {
  "folke/zen-mode.nvim",
  keys = {
    {
      "<leader>zz",
      function()
        require("zen-mode").toggle()
        vim.wo.wrap = false
        vim.wo.number = true
        vim.wo.rnu = true
      end,
      desc = "Zen Mode (90w)",
    },
    {
      "<leader>zZ",
      function()
        require("zen-mode").setup({
          window = { width = 80, options = {} },
        })
        require("zen-mode").toggle()
        vim.wo.wrap = false
        vim.wo.number = false
        vim.wo.rnu = false
        vim.opt.colorcolumn = "0"
      end,
      desc = "Zen Mode (80w, no numbers)",
    },
  },
  opts = {
    window = { width = 90, options = {} },
  },
}
