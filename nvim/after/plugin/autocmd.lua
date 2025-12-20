local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = highlight_group,
  callback = function() vim.highlight.on_yank() end,
  pattern = "*",
})

local dap_group = vim.api.nvim_create_augroup("AttachDapRepl", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = dap_group,
  pattern = "dap-repl",
  callback = function() require("dap.ext.autocompl").attach() end,
})

local whitespace_group = vim.api.nvim_create_augroup("RemoveTrailingWhitespaces", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
  group = whitespace_group,
  pattern = "*",
  command = [[%s/\s\+$//e]],
})
