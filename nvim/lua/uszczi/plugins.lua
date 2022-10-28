local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.cmd [[packadd packer.nvim]]
vim.cmd "autocmd BufWritePost uszczi/packer.lua PackerCompile"

local use = require("packer").use
return require("packer").startup(
    function()
        use "wbthomason/packer.nvim"
        use "nvim-lua/plenary.nvim"
        use "nvim-lua/popup.nvim"
        use "tpope/vim-repeat"
        use "mhinz/vim-signify" -- Git status column
        use "tpope/vim-fugitive"
        use "onsails/lspkind-nvim"
        use "sbdchd/neoformat"

        use "ThePrimeagen/harpoon"
        use "TimUntersberger/neogit"
        use "mbbill/undotree"

        use "terrortylor/nvim-comment"
        use "windwp/nvim-autopairs"
        use "kylechui/nvim-surround"

        use "ggandor/leap.nvim" -- s find
        use "nelstrom/vim-visual-star-search"
        use "nicwest/vim-camelsnek"

        use "ThePrimeagen/refactoring.nvim"

        -- Theme
        -- use "gruvbox-community/gruvbox"
        use "folke/tokyonight.nvim"

        -- Treesitter
        use "nvim-treesitter/nvim-treesitter"
        use "nvim-treesitter/playground"

        --
        use "jose-elias-alvarez/null-ls.nvim"
        use "jose-elias-alvarez/nvim-lsp-ts-utils"

        -- LSP
        -- use "nvim-lua/lsp-status.nvim"
        -- use "nvim-lualine/lualine.nvim"
        -- use "arkav/lualine-lsp-progress"
        use "j-hui/fidget.nvim"
        use "neovim/nvim-lspconfig"
        use "nvim-lua/completion-nvim"

        -- LSP clients
        -- Rust
        use "simrat39/rust-tools.nvim"

        -- Vue
        use "johnsoncodehk/volar"
        use "vuejs/vetur"

        -- Telescope
        use "nvim-telescope/telescope.nvim"
        use "nvim-telescope/telescope-dap.nvim"
        use "nvim-telescope/telescope-github.nvim"
        use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
        use "nvim-telescope/telescope-project.nvim"

        -- Dap
        use "mfussenegger/nvim-dap"
        use "mfussenegger/nvim-dap-python"
        use "rcarriga/nvim-dap-ui"
        use "theHamsta/nvim-dap-virtual-text"

        ----
        use "tyru/open-browser.vim"
        use "tyru/open-browser-github.vim"

        use "vim-airline/vim-airline"
        use "vim-airline/vim-airline-themes"

        use "kyazdani42/nvim-tree.lua"
        use "kyazdani42/nvim-web-devicons"

        use "vim-test/vim-test"

        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup {
                    triggers_blacklist = {}
                }
            end
        }

        use "hrsh7th/cmp-nvim-lsp"
        use "hrsh7th/cmp-buffer"
        use "hrsh7th/cmp-path"
        use "hrsh7th/cmp-cmdline"
        use "hrsh7th/nvim-cmp"
        use "hrsh7th/cmp-nvim-lsp-signature-help"
        use "hrsh7th/cmp-vsnip"
        use "hrsh7th/vim-vsnip"

        -- Snipets
        use "L3MON4D3/LuaSnip"
        use "rafamadriz/friendly-snippets"
        use "saadparwaiz1/cmp_luasnip"

        --use "tpope/vim-abolish"
        --use "ThePrimeagen/git-worktree.nvim"
        use "sindrets/diffview.nvim"
        use "khaveesh/vim-fish-syntax"
    end
)
