local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"stevearc/oil.nvim", -- file explorer
	"nvim-neotest/nvim-nio",
	"folke/neodev.nvim",
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	-- "github/copilot.vim",
	"dbeniamine/cheat.sh-vim",
	-- Window
	"nvim-lualine/lualine.nvim",
	"lukas-reineke/indent-blankline.nvim",
	-- Typing
	"kylechui/nvim-surround",

	{
		url = "https://codeberg.org/andyg/leap.nvim",
		init = function()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
			vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")
		end,
	},
	"numToStr/Comment.nvim",
	"mbbill/undotree",
	"ThePrimeagen/refactoring.nvim",
	"nicwest/vim-camelsnek",
	{ "akinsho/toggleterm.nvim", version = "*", config = true },
	-- Telescope
	"nvim-telescope/telescope.nvim",
	"https://git.myzel394.app/Myzel394/jsonfly.nvim", -- to test
	"nvim-telescope/telescope-symbols.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
		end,
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
		end,
	},
	-- Dependencies
	"nvim-lua/plenary.nvim",
	-- Formating
	"sbdchd/neoformat",
	"mhartington/formatter.nvim",
	-- Debug
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
	},
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/cmp-dap",
	-- Python
	-- "mfussenegger/nvim-dap-python",
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
			require("octo").setup({
				use_local_fs = true,
			})
		end,
	},
	-- LSP
	{
		"AckslD/nvim-pytrize.lua",
		init = function()
			require("pytrize").setup()
		end,
	},
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
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
		dir = "~/dotfiles/dotfiles-private",
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
	{
		"yetone/avante.nvim",
		-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
		-- ⚠️ must add this setting! ! !
		build = vim.fn.has("win32") ~= 0
				and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
			or "make",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		---@module 'avante'
		---@type avante.Config
		opts = {
			-- add any opts here
			-- this file can contain specific instructions for your project
			instructions_file = "avante.md",
			-- for example
			provider = "claude",
			providers = {
				claude = {
					endpoint = "https://api.anthropic.com",
					model = "claude-sonnet-4-20250514",
					timeout = 30000, -- Timeout in milliseconds
					extra_request_body = {
						temperature = 0.75,
						max_tokens = 20480,
					},
				},
				moonshot = {
					endpoint = "https://api.moonshot.ai/v1",
					model = "kimi-k2-0711-preview",
					timeout = 30000, -- Timeout in milliseconds
					extra_request_body = {
						temperature = 0.75,
						max_tokens = 32768,
					},
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-mini/mini.pick", -- for file_selector provider mini.pick
			"nvim-telescope/telescope.nvim", -- for file_selector provider telescope
			"hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
			"ibhagwan/fzf-lua", -- for file_selector provider fzf
			"stevearc/dressing.nvim", -- for input provider dressing
			"folke/snacks.nvim", -- for input provider snacks
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua", -- for providers='copilot'
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
			{
				-- Make sure to set this up properly if you have lazy=true
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					file_types = { "markdown", "Avante" },
				},
				ft = { "markdown", "Avante" },
			},
		},
	},
}, {})
