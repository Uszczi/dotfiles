local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath
        }
    )
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        -- Telescope
        "nvim-telescope/telescope.nvim",
        "nvim-telescope/telescope-symbols.nvim",
        {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
        -- Treesitter
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects",
        -- Theme
        {
            "navarasu/onedark.nvim",
            init = function()
                vim.cmd([[colorscheme onedark]])
            end
        },
        -- Navigation
        "ThePrimeagen/harpoon",
        -- Dependencies
        "nvim-lua/plenary.nvim",
        -- Formating
        "sbdchd/neoformat",
        -- Debug
        {
            "dstein64/vim-startuptime",
            cmd = "StartupTime"
        },
        -- Git
        "TimUntersberger/neogit",
        -- LSP
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        "folke/neodev.nvim",
        -- CMP
        "onsails/lspkind-nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        -- SPEND MORE TIME ON THEM
        "tpope/vim-rhubarb",
        "lewis6991/gitsigns.nvim",
        "nvim-lualine/lualine.nvim",
        "lukas-reineke/indent-blankline.nvim",
        "numToStr/Comment.nvim",
        "tpope/vim-sleuth",
        "hrsh7th/cmp-nvim-lsp-signature-help"
    },
    {}
)
