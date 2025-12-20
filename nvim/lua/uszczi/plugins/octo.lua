return {
  {
    "NWVi/octo.nvim",
    branch = "config-review-use-local-fs",
    init = function()
      require("octo").setup({
        use_local_fs = true,
      })
    end,
  },
}
