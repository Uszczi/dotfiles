local status, zen = pcall(require, "zen-mode")
if (not status) then return end

zen.setup {
    window = {width = 127, options = {number = true, relativenumber = true}},
    gitsigns = {enabled = false}
}
vim.keymap.set("n", "<leader>zz", function()
    zen.toggle()
    vim.wo.wrap = false
end)
