local ls = require "luasnip"
local types = require "luasnip.util.types"
-- expand
-- expand

ls.config.set_config {
    -- This tells LuaSnip to remember to keep around the last snippet.
    -- You can jump back into it even if you move outside of the selection
    history = true,
    -- This one is cool cause if you have dynamic snippets, it updates as you type!
    updateevents = "TextChanged,TextChangedI",
    -- Autosnippets:
    enable_autosnippets = true,
    -- Crazy highlights!!
    -- #vid3
    -- ext_opts = nil,
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = {{" <- Current Choice", "NonTest"}}
            }
        }
    }
}

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set(
    {"i", "s"},
    "<c-k>",
    function()
        P("HEllo world:")
        if (ls.expand_or_jumpable() == true) then
            P {"prejump"}
            ls.expand_or_jump()
            P("ho jump")
        else
            P("co kuirder")
            ls.expand_or_jump()
            P(ls.expand_or_jumpable())
        end
    end,
    {silent = false}
)
-- expand
ls.add_snippets(
    "all",
    {
        ls.parser.parse_snippet("expand", "-- this is what was expended"),
        ls.parser.parse_snippet("pseed", 'pytest.mark.usefixtures("seed_with_function_name")')
    }
)

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set(
    {"i", "s"},
    "<c-j>",
    function()
        if ls.jumpable(-1) then
            ls.jump(-1)
        end
    end,
    {silent = true}
)

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set(
    "i",
    "<c-l>",
    function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end
)

vim.keymap.set("i", "<c-u>", require "luasnip.extras.select_choice")

vim.keymap.set("n", "<space>hs", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

ls.snippets = {
    all = {
        ls.parser.parse_snippet("expand", "-- this is what was expended")
    },
    lua = {},
    python = {}
}
