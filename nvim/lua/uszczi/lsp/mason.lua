local status, mason = pcall(require, "mason")
if (not status) then
    return
end

local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not status) then
    return
end

mason.setup(
    {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
)

mason_lspconfig.setup(
    {
        ensure_installed = {
            -- "bashls",
            "sumneko_lua",
            -- "pyright",
            -- "tsserver",
            -- "html",
            -- "yamlls",
            -- "dockerls",
            "tailwindcss",
            -- "jsonls",
            "prismals"
        },
        automatic_installation = true
    }
)
