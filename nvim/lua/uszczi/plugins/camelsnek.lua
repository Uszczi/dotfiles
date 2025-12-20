return {
  "nicwest/vim-camelsnek",
  keys = {
    { "css", "<cmd>Snek<cr>", mode = { "n", "v" }, desc = "To snake_case" },
    { "csc", "<cmd>CamelB<cr>", mode = { "n", "v" }, desc = "To camelCase" },
    { "csx", "<cmd>Kebab<cr>", mode = { "n", "v" }, desc = "To kebab-case" },
    { "cse", "<cmd>CamelB<cr>bgUle", mode = { "n", "v" }, desc = "To PascalCase" },
  },
}
