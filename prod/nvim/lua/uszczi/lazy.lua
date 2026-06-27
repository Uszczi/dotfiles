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
    "klen/nvim-test",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("nvim-test").setup({})

      vim.keymap.set({ "n" }, "<leader>tf", ":TestFile<CR>")
      vim.keymap.set({ "n" }, "<leader>tl", ":TestLast<CR>")
      vim.keymap.set({ "n" }, "<leader>tn", ":TestNearest<CR>")
    end,
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
