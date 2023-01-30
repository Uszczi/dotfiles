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
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "rafamadriz/friendly-snippets",
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
        "onsails/lspkind-nvim",
        {"nvim-telescope/telescope-fzf-native.nvim", run = "make", cond = vim.fn.executable "make" == 1}
    },
    {}
)
