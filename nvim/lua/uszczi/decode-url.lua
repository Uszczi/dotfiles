local hex_to_char = function(x) return string.char(tonumber(x, 16)) end

local unescape = function(url) return url:gsub("%%(%x%x)", hex_to_char) end

local function get_selected_text()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "x", false)
  local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
  local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))

  local text
  if cecol > 10000 then
    text = vim.api.nvim_buf_get_text(0, csrow - 1, cscol - 1, cerow - 1, cecol - 1, {})
  else
    text = vim.api.nvim_buf_get_text(0, csrow - 1, cscol - 1, cerow - 1, cecol, {})
  end

  return text, csrow, cscol, cerow, cecol
end

local function set_selected_text(text, csrow, cscol, cerow, cecol)
  if cecol > 10000 then
    vim.api.nvim_buf_set_lines(0, csrow - 1, cerow, false, text)
  else
    vim.api.nvim_buf_set_text(0, csrow - 1, cscol - 1, cerow - 1, cecol, text)
  end
end

local decode_selected_text = function()
  local text, csrow, cscol, cerow, cecol = get_selected_text()
  local decoded_text = {}
  for _, part in ipairs(text) do
    local decoded = unescape(part)
    table.insert(decoded_text, decoded)
  end
  set_selected_text(decoded_text, csrow, cscol, cerow, cecol)
end

vim.keymap.set({ "n", "v" }, "<leader>ru", function() decode_selected_text() end, { silent = false })
