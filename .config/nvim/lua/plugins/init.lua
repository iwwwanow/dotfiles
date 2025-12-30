return {
	{
		"kdheepak/monochrome.nvim",
		config = function()
			vim.o.background = "light"
			vim.g.monochrome_style = "coolgray"
			vim.cmd("colorscheme monochrome")
			vim.api.nvim_set_hl(0, "NonText", { fg = "#FF00FF" }) -- красный
		end,
	},
	-- {
	-- 	"Mofiqul/adwaita.nvim",
	-- 	lazy = false,
	-- 	priority = 1000,
	--
	-- 	-- configure and set on startup
	-- 	config = function()
	-- 		vim.g.adwaita_darker = false -- for darker version
	-- 		vim.g.adwaita_disable_cursorline = false -- to disable cursorline
	-- 		vim.g.adwaita_transparent = false -- makes the background transparent
	-- 		vim.cmd("colorscheme adwaita")
	-- 	end,
	-- },
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine").setup()
		end,
	},
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("plugins/nvim-ts-context-commentstring")
		end,
	},
	{
		"terrortylor/nvim-comment",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("plugins/nvim-comment")
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
	},
	{
		"tpope/vim-surround",
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		lazy = true,
		config = function()
			require("plugins/telescope")
		end,
	},
	{
		"lbrayner/vim-rzip",
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins/oil")
		end,
	},
	{
		"mason-org/mason.nvim",
		build = ":MasonUpdate",
		config = function()
			require("plugins.mason").setup()
		end,
	},
	-- {
	-- 	"pmizio/typescript-tools.nvim",
	-- 	dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	-- 	opts = {},
	-- },
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("plugins/lsp").setup()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins/treesitter")
		end,
	},
	{
		"luckasRanarison/tree-sitter-hypr",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					typescript = { "prettier" },
					javascript = { "prettier" },
					go = { "gofumpt", "goimports-reviser", "golines" },
					typescriptreact = { "prettier" },
					javascriptreact = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					lua = { "stylua" },
					markdown = { "prettier" },
				},
				format_on_save = {
					timeout_ms = 1500,
					lsp_fallback = true,
				},
			})
		end,
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				color_icons = false,
			})
			vim.schedule(function()
				vim.api.nvim_set_hl(0, "DevIconDefault", { fg = "#0000FF" })
			end)
		end,
	},
	{
		"terrastruct/d2-vim",
		ft = { "d2" },
	},

	-- cmp
	{
		"David-Kunz/cmp-npm",
		dependencies = { "nvim-lua/plenary.nvim" },
		ft = "json",
		-- config = function()
		-- 	require("cmp-npm").setup({})
		-- end,
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"David-Kunz/cmp-npm",
		},
		config = function()
			require("plugins.cmp").setup()
		end,
	},
}
