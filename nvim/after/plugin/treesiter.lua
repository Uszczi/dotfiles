if vim.fn.has("win32") == 1 then
    require "nvim-treesitter.install".compilers = {"clang"}
end

require "nvim-treesitter.configs".setup {
    -- A list of parser names, or "all" (the four listed parsers should always be installed)
    ensure_installed = {"python", "lua", "vim", "json"},
    highlight = {
        enable = true
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm"
        }
    }
}
