return {
  "NeogitOrg/neogit",
  config = function()
    require("neogit").setup({
      status = {
        recent_commit_count = 30,
      },
      integrations = {
        telescope = true,
        diffview = true,
        fzf_lua = true,
      },
    })
  end,
  keys = {
    {
      "<leader>gg",
      function() require("neogit").open() end,
      desc = "Open Neogit",
    },
  },
}
