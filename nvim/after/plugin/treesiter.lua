if vim.fn.has("win32") == 1 then
    require "nvim-treesitter.install".compilers = {"clang"}
end

require "nvim-treesitter.configs".setup {
    -- A list of parser names, or "all" (the four listed parsers should always be installed)
    ensure_installed = {"python", "lua", "vim", "help"},
    highlight = {
        enable = true
    }
}
