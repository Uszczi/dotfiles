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
        "stevearc/oil.nvim", -- file explorer
        "nvim-neotest/nvim-nio",
        "folke/neodev.nvim",
        {
            "folke/trouble.nvim",
            dependencies = {"nvim-tree/nvim-web-devicons"},
            opts = {}
        },
        -- "github/copilot.vim",
        "dbeniamine/cheat.sh-vim",
        -- Window
        "nvim-lualine/lualine.nvim",
        "lukas-reineke/indent-blankline.nvim",
        -- Typing
        "kylechui/nvim-surround",
        "numToStr/Comment.nvim",
        "mbbill/undotree",
        "ThePrimeagen/refactoring.nvim",
        "nicwest/vim-camelsnek",
        {"akinsho/toggleterm.nvim", version = "*", config = true},
        -- Telescope
        "nvim-telescope/telescope.nvim",
        "https://git.myzel394.app/Myzel394/jsonfly.nvim", -- to test
        "nvim-telescope/telescope-symbols.nvim",
        {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
        "nvim-telescope/telescope-project.nvim",
        "nvim-telescope/telescope-dap.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-smart-history.nvim",
        -- Treesitte
        "nvim-treesitter/nvim-treesitter",
        "nvim-treesitter/nvim-treesitter-textobjects",
        -- Look
        "jlcrochet/vim-razor",
        "nvim-tree/nvim-web-devicons",
        {
            "catppuccin/nvim",
            name = "catppuccin",
            priority = 1000,
            init = function()
                vim.cmd([[colorscheme catppuccin-mocha]])
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
        "mhartington/formatter.nvim",
        -- Debug
        {
            "dstein64/vim-startuptime",
            cmd = "StartupTime"
        },
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
        "theHamsta/nvim-dap-virtual-text",
        "rcarriga/cmp-dap",
        -- Python
        "mfussenegger/nvim-dap-python",
        -- Git
        "NeogitOrg/neogit",
        "ibhagwan/fzf-lua", -- for neogit
        "lewis6991/gitsigns.nvim",
        "mhinz/vim-signify",
        "tpope/vim-fugitive",
        "tpope/vim-rhubarb",
        "tommcdo/vim-fubitive",
        "Uszczi/git-worktree.nvim",
        "junegunn/gv.vim",
        "rbong/vim-flog",
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
        {
            "AckslD/nvim-pytrize.lua",
            init = function()
                require("pytrize").setup()
            end
        },
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        {
            "j-hui/fidget.nvim",
            tag = "legacy"
        },
        "folke/neodev.nvim",
        "klen/nvim-test",
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
        "tpope/vim-sleuth",
        "tpope/vim-repeat",
        "Uszczi/nvim-scrapy-debug",
        "rcarriga/nvim-notify",
        {
            dir = "~/dotfiles/dotfiles-private"
        },
        "ggandor/leap.nvim",
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true
            -- use opts = {} for passing setup options
            -- this is equivalent to setup({}) function
        }
    },
    {}
)
