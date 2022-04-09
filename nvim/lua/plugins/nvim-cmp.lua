local cmp = require("cmp")

cmp.setup(
    {
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },
        mapping = {
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
            ["<C-f>"] = cmp.mapping(
                cmp.mapping.scroll_docs(4),
                {
                    "i",
                    "c"
                }
            ),
            ["<C-Space>"] = cmp.mapping(
                cmp.mapping.complete(),
                {
                    "i",
                    "c"
                }
            ),
            ["<C-y>"] = cmp.config.disable,
            ["<C-[>"] = cmp.mapping( -- TODO test that
                {
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close()
                }
            ),
            ["<CR>"] = cmp.mapping.confirm(
                {
                    select = true
                }
            )
        },
        sources = cmp.config.sources(
            {
                {name = "nvim_lua"},
                {name = "nvim_lsp"},
                {name = "luasnip"},
                {name = "vsnip"},
                {name = "buffer"},
                {name = "path"},
                {name = "vim-dadbod-completion"}
            }
        ),
        formatting = {
            format = require("lspkind").cmp_format(
                {
                    before = function(entry, vim_item)
                        -- -- P(entry)
                        -- P(entry.source.name)
                        return vim_item
                    end,
                    with_text = true,
                    menu = ({
                        luasnip = "[LuaSnip]",
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        path = "[path]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[Latex]",
                        ["vim-dadbod-completion"] = "[dadbod]"
                    })
                }
            )
        }
    }
)

cmp.setup.cmdline(
    "/",
    {
        sources = {
            {
                name = "buffer"
            }
        }
    }
)

cmp.setup.cmdline(
    ":",
    {
        sources = cmp.config.sources(
            {
                {
                    name = "path"
                }
            },
            {
                {
                    name = "cmdline"
                }
            }
        ),
        formatting = {
            format = require("lspkind").cmp_format(
                {
                    with_text = true,
                    menu = ({
                        buffer = "[Buffer]",
                        nvim_lsp = "[LSP]",
                        luasnip = "[LuaSnip]",
                        nvim_lua = "[Lua]",
                        latex_symbols = "[Latex]"
                    })
                }
            )
        }
    }
)
