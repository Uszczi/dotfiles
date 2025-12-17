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
	{ -- quick jump to sequence of two letters
		url = "https://codeberg.org/andyg/leap.nvim",
		init = function()
			vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
			vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
			vim.keymap.set("n", "gs", "<Plug>(leap-from-window)")
		end,
	},
	"stevearc/oil.nvim", -- file explorer with text base modifications
	--------
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
			provider = "openai-gpt-5-nano",

			providers = {
				openrouter = {
					__inherited_from = "openai",
					endpoint = "https://openrouter.ai/api/v1",
					api_key_name = "AVANTE_OPENROUTER_API_KEY",
					model = "qwen/qwen3-coder:free",
				},

				openai = {
					endpoint = "https://api.openai.com/v1",
					model = "gpt-4o",
					timeout = 30000,
					max_tokens = 8192,
				},

				["openai-gpt-5"] = {
					__inherited_from = "openai",
					model = "gpt-5",
				},
				["openai-gpt-5-mini"] = {
					__inherited_from = "openai",
					model = "gpt-5-mini",
				},
				["openai-gpt-5-nano"] = {
					__inherited_from = "openai",
					model = "gpt-5-nano",
				},
			},

			behavior = {
				auto_apply_diff_after_generation = false,
				auto_suggestions = false,
				support_paste_from_clipboard = false,
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
