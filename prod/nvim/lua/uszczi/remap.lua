local set = vim.keymap.set

local function run_file()
  local mappings = {
    python = "!python3 %",
    lua = "so %",
    sh = "! %",
  }

  local ft = vim.api.nvim_buf_get_option(0, "filetype")

  local command = mappings[ft]
  if command ~= nil then
    print("Running '" .. command .. "'.")
    vim.api.nvim_command(mappings[ft])
  else
    print("Unknown filetype.")
  end
end

set("n", "<leader>hh", run_file)
set("n", "-", ":Ex<CR>")

set("n", "[d", vim.diagnostic.goto_prev)
set("n", "]d", vim.diagnostic.goto_next)
set("n", "[q", ":cprevious<CR>")
set("n", "]q", ":cnext<CR>")
set("n", "[Q", ":cfirst<CR>")
set("n", "]Q", ":clast<CR>")
set("n", "[w", ":cprevious<CR>")
set("n", "]e", ":cnext<CR>")

set("n", "<leader>e", vim.diagnostic.open_float)

set("n", "<C-u>", "<C-u>zz")
set("n", "<C-d>", "<C-d>zz")
set("n", "n", "nzz", { remap = true })
set("n", "N", "Nzz", { remap = true })

set("n", "<leader>cr", ":w !python %<CR>")
set("n", "<leader>rg", ":e ./plan.ignore.md<CR>")

set("t", "<C-o>", "<C-\\><C-N>")

set("n", "<leader>gd", ":DiffviewOpen<CR>")
