local use = require("packer").use
return require("packer").startup(
    function()
        use "terrortylor/nvim-comment"
        use "tpope/vim-repeat"

        use "ggandor/leap.nvim"
        use "nvim-treesitter/nvim-treesitter"
        use "nvim-treesitter/playground"

        use "neovim/nvim-lspconfig"
        use "jose-elias-alvarez/null-ls.nvim"
        use "jose-elias-alvarez/nvim-lsp-ts-utils"
        use "khaveesh/vim-fish-syntax"

        -- Tab utils
        use "gcmt/taboo.vim"

        -- LSP
        use "nvim-lua/lsp-status.nvim"

        -- Maybe check that in future
        -- use "arkav/lualine-lsp-progress"
        use "j-hui/fidget.nvim"

        -- Dap
        use "mfussenegger/nvim-dap"
        use "mfussenegger/nvim-dap-python"
        use "rcarriga/nvim-dap-ui"
        use "theHamsta/nvim-dap-virtual-text"
        use "/nvim-telescope/telescope-dap.nvim"

        use "tyru/open-browser.vim"
        use "weirongxu/plantuml-previewer.vim"

        use "/home/mateusz/projects/bread-jump.nvim"

        use "vim-test/vim-test"
        use {
            "pwntester/octo.nvim",
            requires = {
                "kyazdani42/nvim-web-devicons"
            },
            config = function()
                require "octo".setup()
            end
        }
        use "nvim-telescope/telescope-github.nvim"

        use "vim-airline/vim-airline"
        use "vim-airline/vim-airline-themes"

        use "sbdchd/neoformat"

        use "TimUntersberger/neogit"

        use "mhinz/vim-signify" -- Git status column
        --         use 'voldikss/vim-floaterm'
        use "dstein64/vim-startuptime"
        --         use 'vim-test/vim-test'
        --
        --         use "preservim/nerdtree"
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
        --         use "nvim-treesitter/nvim-treesitter"
        --         use "TimUntersberger/neogit"
        use "sindrets/diffview.nvim"

        --         use "rbong/vim-flog"
        --         use "tjdevries/train.nvim"
        --         use {
        --             "lazytanuki/nvim-mapper",
        --             config = function()
        --                 require("nvim-mapper").setup {}
        --             end,
        --             before = "telescope.nvim"
        --         }
        use "mbbill/undotree"
        --         use {"ellisonleao/glow.nvim"}
        --         use "ggandor/lightspeed.nvim"
        --         use "kyazdani42/nvim-web-devicons"
        --         use {
        --             "pwntester/octo.nvim",
        --             config = function()
        --                 require "octo".setup({})
        --             end
        --         }
        --
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons"
            }
        }
        --
        --
        --         use {"Mofiqul/dracula.nvim"}

        -- Terraform
        use "hashivim/vim-terraform"

        use {
            "nvim-lua/plenary.nvim"
        }
        use "ThePrimeagen/harpoon"
        use "ThePrimeagen/git-worktree.nvim"
        use "nvim-telescope/telescope-project.nvim"
        --
        --         use {
        --             "wbthomason/packer.nvim",
        --             opt = true
        --         }
        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup {
                    triggers_blacklist = {}
                }
            end
        }
        --
        --         use "lukas-reineke/format.nvim"
        --
        --
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                {
                    "nvim-lua/popup.nvim"
                },
                {
                    "nvim-lua/plenary.nvim"
                }
            }
        }

        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/nvim-cmp"

        use "hrsh7th/cmp-vsnip"
        use "hrsh7th/vim-vsnip"

        use "onsails/lspkind-nvim"
        use "rafamadriz/friendly-snippets"

        use "nvim-lua/completion-nvim"
        --         use "tjdevries/nlua.nvim"
        --         use "tpope/vim-dispatch"
        use "tpope/vim-fugitive"
        use "tpope/vim-jdaddy"

        --  Database connection
        use "tpope/vim-dadbod"
        use "kristijanhusak/vim-dadbod-ui"
        use "kristijanhusak/vim-dadbod-completion"

        -- Rust
        use "simrat39/rust-tools.nvim"

        -- Vue
        use "johnsoncodehk/volar"
        use "vuejs/vetur"

        -- snipets
        use "L3MON4D3/LuaSnip"
        use "saadparwaiz1/cmp_luasnip"

        --- nnn
        use {
            "luukvbaal/nnn.nvim",
            config = function()
                require("nnn").setup()
            end
        }

        use "ThePrimeagen/refactoring.nvim"

        -- Colorschema
        -- use "gruvbox-community/gruvbox"
        use "folke/tokyonight.nvim"

        use "lukas-reineke/indent-blankline.nvim"
        use "kylechui/nvim-surround"

        use "nelstrom/vim-visual-star-search"
        use "tpope/vim-abolish"
        use "tricktux/pomodoro.vim"

        use "nicwest/vim-camelsnek"
    end
)
