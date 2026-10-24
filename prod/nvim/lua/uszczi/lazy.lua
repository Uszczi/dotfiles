local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
  { import = "uszczi.plugins" },
  { "Uszczi/zettelkasten.nvim", opts = {
    vault = "~/zetel/Zettelkasten",
  } },
  {
    {
      "supermaven-inc/supermaven-nvim",
      config = function() require("supermaven-nvim").setup({}) end,
    },
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-python",
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python"),
        },
      })

      local neotest = require("neotest")
      vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Test file" })
      vim.keymap.set("n", "<leader>tn", function() neotest.run.run() end, { desc = "Test nearest" })
      vim.keymap.set("n", "<leader>tl", function() neotest.run.run_last() end, { desc = "Test last" })
    end,
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  "rcarriga/nvim-notify",
  "dbeniamine/cheat.sh-vim",
}

require("lazy").setup(plugins, {
  change_detection = {
    enabled = true,
    notify = false,
  },
})
