local my_attach = function(client, bufnr)
    -- Use LSP as the handler for omnifunc.
    --    See `:help omnifunc` and `:help ins-completion` for more information.
    -- vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Use LSP as the handler for formatexpr.
    --    See `:help formatexpr` for more information.
    -- vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

    -- For plugins with an `on_attach` callback, call them here. For example:
    -- require('completion').on_attach()

    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    local opts = {noremap = true, silent = true}
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

--   _
--  | |   _   _  __ _
--  | |  | | | |/ _` |
--  | |__| |_| | (_| |
--  |_____\__,_|\__,_|
--
local sumneko_root_path
local sumneko_binary_path

local platform = vim.loop.os_uname().sysname
if platform:find("^Windows") ~= nil then
    sumneko_root_path = "C:\\lua_lsp"
    sumneko_binary_path = sumneko_root_path .. "\\bin\\Windows\\lua-language-server"
else
    sumneko_binary_path = "/home/mateusz/Pobrane/lua-language/bin/lua-language-server"
    sumneko_root_path = "/home/mateusz/Pobrane/lua-language/bin"
end

require "lspconfig".sumneko_lua.setup {
    on_attach = my_attach,
    cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"},
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                globals = {"vim"}
            },
            telemetry = {
                enable = false
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            }
        }
    }
}

require("lspconfig")["pyright"].setup {
    capabilities = capabilities
}

require("lspconfig")["html"].setup {
    capabilities = capabilities
}

require("lspconfig").tsserver.setup(
    {
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
            local ts_utils = require("nvim-lsp-ts-utils")
            ts_utils.setup({})
            ts_utils.setup_client(client)
            my_attach(client, bufnr)
        end
    }
)

-- local opts = {
--     tools = {
--         -- rust-tools options
--         autoSetHints = true,
--         hover_with_actions = true,
--         inlay_hints = {
--             show_parameter_hints = false,
--             parameter_hints_prefix = "",
--             other_hints_prefix = ""
--         }
--     },
--     -- all the opts to send to nvim-lspconfig
--     -- these override the defaults set by rust-tools.nvim
--     -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
--     server = {
--         -- on_attach is a callback called when the language server attachs to the buffer
--         on_attach = my_attach,
--         settings = {
--             -- to enable rust-analyzer settings visit:
--             -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
--             ["rust-analyzer"] = {
--                 -- enable clippy on save
--                 checkOnSave = {
--                     command = "clippy"
--                 }
--             }
--         }
--     }
-- }

-- ______          _
-- | ___ \        | |
-- | |_/ /   _ ___| |_
-- |    / | | / __| __|
-- | |\ \ |_| \__ \ |_
-- \_| \_\__,_|___/\__|
--
--
require("rust-tools").setup({})

--  _   _
-- | | | |
-- | | | |_   _  ___
-- | | | | | | |/ _ \
-- \ \_/ / |_| |  __/
--  \___/ \__,_|\___|
--
--
local util = require "lspconfig.util"
local function get_typescript_server_path(root_dir)
    -- local global_ts = "/home/[yourusernamehere]/.npm/lib/node_modules/typescript/lib/tsserverlibrary.js"
    -- Alternative location if installed as root:
    local global_ts = "/usr/local/lib/node_modules/typescript/lib/tsserverlibrary.js"
    local found_ts = ""
    local function check_dir(path)
        found_ts = util.path.join(path, "node_modules", "typescript", "lib", "tsserverlibrary.js")
        if util.path.exists(found_ts) then
            return path
        end
    end
    if util.search_ancestors(root_dir, check_dir) then
        return found_ts
    else
        return global_ts
    end
end

require "lspconfig".volar.setup {
    on_new_config = function(new_config, new_root_dir)
        new_config.init_options.typescript.serverPath = get_typescript_server_path(new_root_dir)
    end
}
