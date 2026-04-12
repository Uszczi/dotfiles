return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "folke/neodev.nvim",
    "rcarriga/cmp-dap",
    "nvim-neotest/nvim-nio",
  },
  keys = {
    {
      "<leader>dw",
      function() require("dapui").eval() end,
      mode = { "n", "v" },
    },
    {
      "<leader>dd",
      function() require("dapui").toggle() end,
    },
    {
      "<leader>da",
      function() require("dapui").toggle({ layout = 2 }) end,
    },
    {
      "<M-k>",
      function() require("dapui").eval() end,
      mode = "v",
    },
    {
      "<leader>de",
      function() require("dap").toggle_breakpoint() end,
    },
    {
      "<leader>db",
      function() require("dap").toggle_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
    },
    {
      "<leader>df",
      function() require("dap").continue() end,
    },
    {
      "<leader>dc",
      function() require("dap").run_to_cursor() end,
    },
    {
      "<leader>do",
      function() require("dap").step_over() end,
    },
    {
      "<leader>di",
      function() require("dap").step_into() end,
    },
    {
      "<leader>dl",
      function() require("dap").run_last() end,
    },
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("nvim-dap-virtual-text").setup({})

    local pythonPath = function() return ".venv/bin/python" end

    dap.adapters.python = {
      type = "executable",
      command = pythonPath(),
      args = { "-m", "debugpy.adapter" },
    }

    dap.adapters.generic_remote = function(callback, config)
      callback({ type = "server", host = "127.0.0.1", port = 5678 })
    end

    require("neodev").setup({ library = { plugins = { "nvim-dap-ui" }, types = true } })

    dapui.setup({
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks", size = 0.25 },
            { id = "watches", size = 0.25 },
          },
          position = "left",
          size = 40,
        },
        { elements = { { id = "repl", size = 1 } }, position = "bottom", size = 10 },
      },
    })

    require("cmp").setup({
      enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
      end,
    })

    require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, { sources = { { name = "dap" } } })
  end,
}
