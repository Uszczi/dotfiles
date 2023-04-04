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
        -- Window
        "nvim-lualine/lualine.nvim",
        "lukas-reineke/indent-blankline.nvim",
        -- Typing
        "kylechui/nvim-surround",
        "numToStr/Comment.nvim",
        "mbbill/undotree",
        "ThePrimeagen/refactoring.nvim",
        "nicwest/vim-camelsnek",
        -- Telescope
        "nvim-telescope/telescope.nvim",
        "nvim-telescope/telescope-symbols.nvim",
        {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
        "nvim-telescope/telescope-project.nvim",
        "nvim-telescope/telescope-dap.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        -- Treesitter
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects",
        -- Look
        "xiyaowong/nvim-transparent",
        "nvim-tree/nvim-web-devicons",
        {
            "navarasu/onedark.nvim",
            init = function()
                vim.cmd([[colorscheme onedark]])
            end
        },
        -- Navigation
        "ThePrimeagen/harpoon",
        "nvim-tree/nvim-tree.lua",
        {
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require("which-key").setup({})
            end
        },
        -- Dependencies
        "nvim-lua/plenary.nvim",
        -- Formating
        "sbdchd/neoformat",
        -- Debug
        {
            "dstein64/vim-startuptime",
            cmd = "StartupTime"
        },
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        -- Python
        "mfussenegger/nvim-dap-python",
        -- Git
        "TimUntersberger/neogit",
        "lewis6991/gitsigns.nvim",
        "mhinz/vim-signify",
        "tpope/vim-fugitive",
        "sindrets/diffview.nvim",
        {
            "NWVi/octo.nvim",
            branch = "config-review-use-local-fs",
            init = function()
                require "octo".setup(
                    {
                        use_local_fs = true
                    }
                )
            end
        },
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
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "ray-x/cmp-treesitter",
        -- TPope
        "tpope/vim-sleuth", -- This plugin automatically adjusts 'shiftwidth' and 'expandtab' heuristically based on the current file
        "tpope/vim-repeat",
        -- {dir = "$HOME/projects/nvim-scrapy-debug"}
        "Uszczi/nvim-scrapy-debug",
        "rcarriga/nvim-notify"
    },
    {}
)
