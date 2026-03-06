local function select_term(index)
  local harpoon = require("harpoon")

  local term_list = harpoon:list("term")
  local item = term_list:get(index)

  if item then
    local buf_name = item.value
    local buf_id = vim.fn.bufnr(buf_name)

    if buf_id ~= -1 and vim.api.nvim_buf_is_valid(buf_id) then
      vim.api.nvim_set_current_buf(buf_id)
    else
      term_list:remove(item)
      print("Terminal buffer was dead, removed from list.")
    end
  else
    print("No terminal at index " .. index)
  end
end

return {
  "ThePrimeagen/harpoon",
  lazy = false,
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({})

    vim.schedule(function()
      harpoon:list("term"):clear()

      if harpoon:list("term"):length() == 0 then
        local current_id = vim.api.nvim_get_current_win()

        vim.cmd("vsplit | terminal")
        local term1_buf = vim.api.nvim_get_current_buf()
        harpoon:list("term"):add()
        vim.api.nvim_buf_set_option(term1_buf, "bufhidden", "hide")

        vim.cmd("split | terminal")
        local term2_buf = vim.api.nvim_get_current_buf()
        harpoon:list("term"):add()
        vim.api.nvim_buf_set_option(term2_buf, "bufhidden", "hide")

        vim.cmd("close")
        vim.cmd("close")

        vim.api.nvim_set_current_win(current_id)
      end
    end)
  end,
  keys = {
    {
      "<leader>a",
      function() require("harpoon"):list():add() end,
      desc = "Harpoon Add File",
    },
    {
      "<C-e>",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "Harpoon Quick Menu",
    },
    {
      "<leader>rq",
      function() require("harpoon"):list():select(1) end,
      desc = "Harpoon Select 1",
    },
    {
      "<leader>rw",
      function() require("harpoon"):list():select(2) end,
      desc = "Harpoon Select 2",
    },
    {
      "<leader>re",
      function() require("harpoon"):list():select(3) end,
      desc = "Harpoon Select 3",
    },
    {
      "<leader>rr",
      function() require("harpoon"):list():select(4) end,
      desc = "Harpoon Select 4",
    },
    {
      "<leader>rp",
      function() require("harpoon"):list():prev() end,
      desc = "Harpoon Prev",
    },
    {
      "<leader>rn",
      function() require("harpoon"):list():next() end,
      desc = "Harpoon Next",
    },
    {
      "<leader>te",
      function() select_term(1) end,
      desc = "Harpoon Go to Term 1",
    },
    {
      "<leader>tu",
      function() select_term(2) end,
      desc = "Harpoon Go to Term 2",
    },
  },
}
