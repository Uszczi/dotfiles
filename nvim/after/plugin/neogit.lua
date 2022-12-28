local neogit = require("neogit")

neogit.setup {}

local function open_neogit()
    local path = vim.loop.cwd() .. "/.git"
    local ok, _ = vim.loop.fs_stat(path)

    if ok then
        neogit.open({})
    else
        neogit.open({cwd = ".."})
    end
end

vim.keymap.set("n", "<leader>gg", open_neogit)
