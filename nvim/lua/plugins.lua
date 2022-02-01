local use = require("packer").use
return require("packer").startup(
    function()
        use "mhinz/vim-signify" -- Git status column
        use 'voldikss/vim-floaterm'

        use 'vim-test/vim-test'
        use 'mfussenegger/nvim-dap-python'

        use "preservim/nerdtree"
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
        use "nvim-treesitter/nvim-treesitter"
        use "TimUntersberger/neogit"
        use "sindrets/diffview.nvim"
        use "vim-airline/vim-airline"
        use "vim-airline/vim-airline-themes"
        use "rbong/vim-flog"
        use "tjdevries/train.nvim"
        use "tpope/vim-surround"
        use {
            "lazytanuki/nvim-mapper",
            config = function()
                require("nvim-mapper").setup {}
            end,
            before = "telescope.nvim"
        }
        use "mbbill/undotree"
        use {"ellisonleao/glow.nvim"}
        use "ggandor/lightspeed.nvim"
        use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
        use "kyazdani42/nvim-web-devicons"
        use "onsails/lspkind-nvim"
        use {
            "pwntester/octo.nvim",
            config = function()
                require "octo".setup({})
            end
        }

        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons"
            }
        }
        use {
            "neovim/nvim-lspconfig"
        }

        -- Rust

        use {"Mofiqul/dracula.nvim"}
        use {
            "hrsh7th/cmp-nvim-lsp"
        }
        use {
            "hrsh7th/cmp-buffer"
        }
        use 'hashivim/vim-terraform'
        use {
            "hrsh7th/cmp-path"
        }
        use {
            "hrsh7th/cmp-cmdline"
        }
        use {
            "hrsh7th/nvim-cmp"
        }
        use "hrsh7th/cmp-vsnip"
        use "hrsh7th/cmp-nvim-lua"
        use "hrsh7th/vim-vsnip"
        use {
            "nvim-lua/plenary.nvim"
        }
        use {
            "ThePrimeagen/harpoon"
        }
        use "nvim-telescope/telescope-project.nvim"

        use {
            "wbthomason/packer.nvim",
            opt = true
        }
        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup {
                    triggers_blacklist = {}
                }
            end
        }
        use "terrortylor/nvim-comment"

        use "lukas-reineke/format.nvim"

        -- Color scheme

        use "gruvbox-community/gruvbox"

        -- Fuzzy finder

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

        use "nvim-lua/completion-nvim"
        use "tjdevries/nlua.nvim"
        use "tpope/vim-dispatch"
        use "tpope/vim-fugitive"
        use "simrat39/rust-tools.nvim"
        use "nvim-lua/popup.nvim"
        use "mfussenegger/nvim-dap"
    end
)
