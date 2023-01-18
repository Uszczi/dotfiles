if not pcall(require, "luasnip") then return end

local ls = require "luasnip"

-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({"i", "s"}, "<c-k>", function()
    if ls.expand_or_jumpable() then ls.expand_or_jump() end
end, {silent = true})

-- this always moves to the previous item within the snippet
vim.keymap.set({"i", "s"}, "<c-j>",
               function() if ls.jumpable(-1) then ls.jump(-1) end end,
               {silent = true})

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set("i", "<c-l>", function()
    if ls.choice_active() then ls.change_choice(1) end
end)

ls.add_snippets("python", {
    ls.parser.parse_snippet("custom",
                            'custom_settings = {"HTTPCACHE_ENABLED": True}')
})

