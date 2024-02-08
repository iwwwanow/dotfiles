vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

	use({ "typicode/bg.nvim" })

	use({
		"neoclide/coc.nvim",
		branch = "release",
	})

	use("edgedb/edgedb-vim")

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	-- use({
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	config = function()
	-- 		require("ibl").setup()
	-- 	end,
	-- })

	use({
		"nvim-lualine/lualine.nvim",
		-- requires = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup()
		end,
	})

	-- COLORSCHEME
	use({
		"effektivnayarabota1/nvim__colorscheme",
		config = function()
			-- vim.g.monochrome_style = "coolgray"
			vim.g.monochrome_style = "amplified"
			vim.cmd("colorscheme monochrome")
		end,
	})

	use({
		"terrortylor/nvim-comment",
		config = function()
			require("nvim_comment").setup()
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use({ "luckasRanarison/tree-sitter-hypr" })

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
