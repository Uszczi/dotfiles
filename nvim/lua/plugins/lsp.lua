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
    --  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
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

require'lspconfig'.sumneko_lua.setup {
    on_attach = my_attach;
    cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
    capabilities = capabilities;
    settings = {
        Lua = {
            runtime = {
                path = vim.split(package.path, ';'),
            },
        diagnostics = {
            globals = {'vim'},
        },
        telemetry = {
            enable = false,
        },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
            },
        },
    }
}}

require("lspconfig")["pyright"].setup {
    capabilities = capabilities
}



require("lspconfig").tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        my_attach(client, bufnr)
    end,
})



