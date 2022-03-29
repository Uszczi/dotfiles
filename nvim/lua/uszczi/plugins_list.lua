local use = require("packer").use
return require("packer").startup(
    function()
        use "terrortylor/nvim-comment"
        use "tpope/vim-surround"
        use "nvim-treesitter/nvim-treesitter"
        use "neovim/nvim-lspconfig"
        use "jose-elias-alvarez/null-ls.nvim"
        use "jose-elias-alvarez/nvim-lsp-ts-utils"

        use "mfussenegger/nvim-dap-python"
        use "mfussenegger/nvim-dap"
        use "rcarriga/nvim-dap-ui"

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

        use "vim-airline/vim-airline"
        use "vim-airline/vim-airline-themes"

        use "sbdchd/neoformat"

        use "TimUntersberger/neogit"

        -- Colorschema
        use "gruvbox-community/gruvbox"

        use "mhinz/vim-signify" -- Git status column
        --         use 'voldikss/vim-floaterm'
        use "dstein64/vim-startuptime"
        --         use 'vim-test/vim-test'
        --
        --         use "preservim/nerdtree"
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
        --         use "nvim-treesitter/nvim-treesitter"
        --         use "TimUntersberger/neogit"
        --         use "sindrets/diffview.nvim"
        --         use "vim-airline/vim-airline"
        --         use "vim-airline/vim-airline-themes"
        --         use "rbong/vim-flog"
        --         use "tjdevries/train.nvim"
        --         use {
        --             "lazytanuki/nvim-mapper",
        --             config = function()
        --                 require("nvim-mapper").setup {}
        --             end,
        --             before = "telescope.nvim"
        --         }
        --         use "mbbill/undotree"
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
        --         use 'hashivim/vim-terraform'
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

        --         use "nvim-lua/completion-nvim"
        --         use "tjdevries/nlua.nvim"
        --         use "tpope/vim-dispatch"
        use "tpope/vim-fugitive"
        --         use "simrat39/rust-tools.nvim"
        --         use "nvim-lua/popup.nvim"
    end
)
