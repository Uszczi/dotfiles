return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  opts = {
    cycle_results = false,
  },

  keys = {
    {
      "<leader>xx",
      function() require("trouble").open() end,
      desc = "Open Trouble",
    },
    {
      "<leader>xw",
      function() require("trouble").open("workspace_diagnostics") end,
      desc = "Trouble Workspace Diagnostics",
    },
    {
      "<leader>xd",
      function() require("trouble").open("document_diagnostics") end,
      desc = "Trouble Document Diagnostics",
    },
    {
      "<leader>xq",
      function() require("trouble").open("quickfix") end,
      desc = "Trouble Quickfix",
    },
    {
      "<leader>xl",
      function() require("trouble").open("loclist") end,
      desc = "Trouble Loclist",
    },
    {
      "gR",
      function() require("trouble").open("lsp_references") end,
      desc = "Trouble LSP References",
    },
  },
}
