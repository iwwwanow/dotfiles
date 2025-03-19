return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	-- UI
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup()
		end,
	})

	-- COMMENTS
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("plugins/nvim-ts-context-commentstring")
		end,
	})

	use({
		"terrortylor/nvim-comment",
		config = function()
			require("plugins/nvim-comment")
		end,
	})

	-- TODO dont works
	use({
		"folke/todo-comments.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
	})

	-- COLORSCHEME
	use({ "typicode/bg.nvim" })
	use({
		"kirill-ivanovvv/nvim-colorscheme",
		config = function()
			require("plugins/nvim-colorscheme")
		end,
	})

	-- EDITOR
	-- use("github/copilot.vim")
	use("tpope/vim-surround")

	-- use({
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	config = function()
	-- 		require("ibl").setup()
	-- 	end,
	-- })

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end,
	})

	-- EXPLORER
	use({
		"luukvbaal/nnn.nvim",
		config = function()
			require("plugins/nnn")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins/telescope")
		end,
	})

	-- SYSTEM
	use("lbrayner/vim-rzip")
	use({
		"stevearc/oil.nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("plugins/oil")
		end,
	})

	use({
		"neoclide/coc.nvim",
		branch = "release",
		config = function()
			require("plugins/coc")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update()
			require("plugins/treesitter")
		end,
	})

	-- use({
	-- 	"nvim-treesitter/nvim-treesitter-context",
	-- 	config = function()
	-- 		require("plugins/nvim-treesitter-context")
	-- 	end,
	-- })

	use({ "luckasRanarison/tree-sitter-hypr" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
