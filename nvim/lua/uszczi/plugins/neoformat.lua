return {
  "sbdchd/neoformat",
  cmd = { "Neoformat" },
  init = function()
    vim.g.neoformat_enabled_python = { "black" }
    vim.g.neoformat_enabled_javascript = { "prettierd", "prettier" }
    vim.g.neoformat_enabled_typescript = { "prettierd", "prettier" }
    vim.g.neoformat_verbose = 0

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.lua", "*.py" },
      callback = function() vim.cmd("Neoformat") end,
    })
  end,
  keys = {
    { "<leader>cc", "<cmd>Neoformat<CR>", desc = "Format Code" },
  },
}
