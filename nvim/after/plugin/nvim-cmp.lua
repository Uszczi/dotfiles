local cmp = require("cmp")

cmp.setup(
    {
        experimental = {
            ghost_text = true
        },
        snippet = {
            expand = function(args)
                require("luasnip").lsp_expand(args.body)
            end
        },
        mapping = {
            ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), {"i", "c"}),
            ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"i", "c"}),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
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
                {name = "luasnip"},
                {name = "nvim_lsp_signature_help"},
                {name = "nvim_lua"},
                {name = "nvim_lsp"},
                -- {name = "vsnip"},
                {name = "buffer"},
                {name = "path"},
                {name = "vim-dadbod-completion"}
            }
        ),
        formatting = {
            format = require("lspkind").cmp_format(
                {
                    before = function(entry, vim_item)
                        vim_item.menu = entry.source:get_debug_name()
                        return vim_item
                    end,
                    with_text = true,
                    menu = nil
                }
            )
        }
    }
)

cmp.setup.cmdline(
    {"/", "?"},
    {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            {name = "buffer"}
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
                    before = function(entry, vim_item)
                        vim_item.menu = entry.source:get_debug_name()
                        return vim_item
                    end,
                    with_text = true,
                    menu = nil
                }
            )
        }
    }
)

require("luasnip/loaders/from_vscode").lazy_load()
