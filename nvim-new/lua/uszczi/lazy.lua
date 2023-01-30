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
        -- Theme
        {
            "navarasu/onedark.nvim",
            init = function()
                vim.cmd([[colorscheme onedark]])
            end
        },
        -- Navigation
        "ThePrimeagen/harpoon",
        "nvim-telescope/telescope.nvim",
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
        -- SPEND MORE TIME ON THEM
        --
        "neovim/nvim-lspconfig",
        -- Automatically install LSPs to stdpath for neovim
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        -- Useful status updates for LSP
        "j-hui/fidget.nvim",
        -- Additional lua configuration, makes nvim stuff amazing
        "folke/neodev.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects",
        "tpope/vim-fugitive",
        "tpope/vim-rhubarb",
        "lewis6991/gitsigns.nvim",
        "nvim-lualine/lualine.nvim",
        "lukas-reineke/indent-blankline.nvim",
        "numToStr/Comment.nvim",
        "tpope/vim-sleuth",
        {"nvim-telescope/telescope.nvim", branch = "0.1.x", requires = {"nvim-lua/plenary.nvim"}},
        {"nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable "make" == 1}
    },
    {}
)
