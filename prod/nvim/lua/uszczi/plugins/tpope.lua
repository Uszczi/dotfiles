return {
  "tpope/vim-fugitive",
  dependencies = {
    "tpope/vim-repeat",
    "tpope/vim-rhubarb",
    "tpope/vim-sleuth",
  },

  config = function()
    vim.keymap.set("n", "<Space>gg", ":Git<CR>")

    local uszczi_augroup = vim.api.nvim_create_augroup("Uszczi_Fugitive", {})

    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      group = uszczi_augroup,
      pattern = { "*" },
      callback = function()
        if vim.bo.ft ~= "fugitive" then return end

        local buffnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = buffnr }

        vim.keymap.set({ "n" }, "q", ":q<CR>", opts)
        vim.keymap.set({ "n" }, "<leader>p", ":Git push<CR>", opts)
        vim.keymap.set({ "n" }, "<leader>P", ":Git pull<CR>", opts)
      end,
    })
  end,
}
