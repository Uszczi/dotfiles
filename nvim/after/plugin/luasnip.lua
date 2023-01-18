if not pcall(require, "luasnip") then return end

local ls = require("luasnip")
local c = ls.choice_node
local t = ls.text_node
local s = ls.snippet

-- https://github.com/L3MON4D3/LuaSnip/blob/b5a72f1fbde545be101fcd10b70bcd51ea4367de/Examples/snippets.lua#L517

-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({"i", "s"}, "<c-k>", function()
    if ls.expand_or_jumpable() then ls.expand_or_jump() end
end, {silent = true})

-- this always moves to the previous item within the snippet
vim.keymap.set({"i", "s"}, "<c-j>",
               function() if ls.jumpable(-1) then ls.jump(-1) end end,
               {silent = true})

-- <c-l> is selecting within a list of options.
vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active() then ls.change_choice(1) end
end)

ls.add_snippets("python", {
    s("httpcache", c(1, {
        t('custom_settings = {"HTTPCACHE_ENABLED": True}'),
        t('"HTTPCACHE_ENABLED": True')
    }))
})

ls.add_snippets("all", {
    s("httpcache", c(1, {
        t('custom_settings = {"HTTPCACHE_ENABLED": True}'),
        t('"HTTPCACHE_ENABLED": True')
    }))
})

vim.keymap.set("n", "<leader>hs",
               "<cmd>source ~/dotfiles/nvim/after/plugin/luasnip.lua<CR>")

