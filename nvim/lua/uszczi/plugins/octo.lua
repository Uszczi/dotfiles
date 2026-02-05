return {
  {
    "NWVi/octo.nvim",
    enabled = false,
    branch = "config-review-use-local-fs",
    init = function()
      require("octo").setup({
        use_local_fs = true,
      })
    end,
  },
}
