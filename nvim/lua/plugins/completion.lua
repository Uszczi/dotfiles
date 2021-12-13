local cmp = require("cmp")

cmp.setup(
    {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
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
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping(
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
                {
                    name = "nvim_lsp",
                    keyword_length = 1
                },
                {
                    name = "vsnip",
                    keyword_length = 3
                },
                {
                    name = "buffer",
                    keyword_length = 4
                },
                {name = "path"}
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

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
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

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
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
        )
    }
)

-- TODO some day
--  -- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require("lspconfig")["pyright"].setup {
    capabilities = capabilities
}
