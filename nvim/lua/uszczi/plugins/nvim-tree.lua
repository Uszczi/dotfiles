return {
  "nvim-tree/nvim-tree.lua",
  dependecies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    reload_on_bufenter = true,
    update_focused_file = {
      enable = true,
    },
  },
  keys = {
    { "<leader>op", ":NvimTreeFindFileToggle<CR>", mode = { "n" }, desc = "Open Nvim Tree" },
  },
}
