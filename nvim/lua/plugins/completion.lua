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
    { name = "nvim_lua" },
                {
                    name = "nvim_lsp",
                },
                {
                    name = "vsnip",
                },
                {
                    name = "buffer",
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
        path = "[path]",
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

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require("lspconfig")["pyright"].setup {
    capabilities = capabilities
}
require("lspconfig")["sumneko_lua"].setup {
    capabilities = capabilities
}



sumneko_root_path = "/usr/lib/lua-language-server"
sumneko_binary_path = "/usr/bin/lua-language-server"
require'lspconfig'.clangd.setup {
  capabilities = capabilities,
}
require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
        diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = {'vim'},
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
            enable = false,
        },
        },
    },
}



