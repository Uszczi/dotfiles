return {
  "norcalli/nvim-colorizer.lua",
  lazy = true,
  keys = {
    { "<leader>cs", "<cmd>ColorizerToggle<cr>", desc = "Toggle Colorizer" },
  },
  config = function() require("colorizer").setup() end,
}
