return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "folke/neodev.nvim",
    { "j-hui/fidget.nvim", opts = {} },
  },
  keys = {
    { "<leader>rn", vim.lsp.buf.rename, desc = "LSP: [R]e[n]ame" },
    { "<leader>ca", vim.lsp.buf.code_action, desc = "LSP: [C]ode [A]ction" },
    { "gd", function() require("telescope.builtin").lsp_definitions() end, desc = "LSP: [G]oto [D]efinition" },
    { "gr", function() require("telescope.builtin").lsp_references() end, desc = "LSP: [G]oto [R]eferences" },
    { "gI", vim.lsp.buf.implementation, desc = "LSP: [G]oto [I]mplementation" },
    { "<leader>D", vim.lsp.buf.type_definition, desc = "LSP: Type [D]efinition" },
    {
      "<leader>ds",
      function() require("telescope.builtin").lsp_document_symbols() end,
      desc = "LSP: [D]ocument [S]ymbols",
    },
    { "K", vim.lsp.buf.hover, desc = "LSP: Hover Documentation" },
    { "<C-k>", vim.lsp.buf.signature_help, desc = "LSP: Signature Documentation" },
    { "gD", vim.lsp.buf.declaration, desc = "LSP: [G]oto [D]eclaration" },
  },
  config = function()
    require("neodev").setup()
    require("mason").setup()
    require("mason-lspconfig").setup()
  end,
}
